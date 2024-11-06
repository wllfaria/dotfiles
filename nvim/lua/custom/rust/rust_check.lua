local function run_cargo_check()
  print("cargo check...")
  vim.cmd("silent make! check")
  vim.cmd("redraw!")

  local qflist = vim.fn.getqflist()
  local error_count = 0
  local warning_count = 0

  if #qflist > 0 then
    local collect_err = 0
    local new_qf_list = {}

    for _, entry in ipairs(qflist) do
      if entry.type == "W" and not entry.text:find(".*generated%s%d*%swarning") then
        warning_count = warning_count + 1
        collect_err = 0
      end

      if entry.type == "E" then
        collect_err = 1
        error_count = error_count + 1
      end

      if collect_err == 1 then table.insert(new_qf_list, entry) end
    end

    vim.fn.setqflist(new_qf_list)
  end

  if error_count > 0 then
    if vim.fn.tabpagewinnr(vim.fn.tabpagenr(), "$") > 1 then
      vim.cmd("botright copen 6")
    else
      vim.cmd("copen 6")
    end
    vim.cmd("wincmd p")
    vim.cmd("cfirst")
  else
    vim.cmd("cclose")
  end

  local err_out = "echo 'E: " .. error_count .. "'"
  if error_count > 0 then err_out = "echohl ToggleRustErr | echo 'E: " .. error_count .. "' | echohl None" end

  local warn_out = " | echon ' | W: " .. warning_count .. "'"
  if warning_count > 0 then
    warn_out = "| echon ' | ' | echohl ToggleRustWarn | echon 'W: " .. warning_count .. "' | echohl None"
  end

  vim.cmd(err_out .. warn_out)
end

vim.api.nvim_create_user_command("CheckRust", function() run_cargo_check() end, {})
vim.keymap.set("n", "<C-X>", function() vim.cmd("CheckRust") end)
