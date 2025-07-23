local errlist_type_map = {
  error = "E",
  warning = "W",
  info = "I",
  hint = "N",
}

local function run_cargo_check()
  vim.fn.setqflist({}, "r")
  -- make check will populate the quickfix list with errors and warnings
  -- and open the qf window if there are any of those.
  --
  -- I don't care about warnings, so I'm going to open the window only on errors.
  vim.cmd("silent! make check")
  vim.cmd("redraw!")

  local total_warnings = 0
  local total_errors = 0

  --- @type vim.quickfix.entry[]
  local qf_list = vim.fn.getqflist()
  if #qf_list <= 0 then
    print("Errors: " .. total_errors .. " | Warnings: " .. total_warnings)
    return
  end

  local collect_lines = false

  local errors_only = {}

  for _, item in ipairs(qf_list) do
    if item.type == errlist_type_map.error then
      total_errors = total_errors + 1
      collect_lines = true
    end

    if item.type == errlist_type_map.warning then
      total_warnings = total_warnings + 1
    end

    if item.type ~= errlist_type_map.error and item.type ~= "" then
      collect_lines = false
    end

    if collect_lines then
      table.insert(errors_only, item)
    end
  end

  vim.fn.setqflist(errors_only, "r")

  if total_errors > 0 then
    if vim.fn.tabpagewinnr(vim.fn.tabpagenr(), "$") > 1 then
      vim.cmd("botright copen 6")
    else
      vim.cmd("copen 6")
    end
    vim.cmd("wincmd p")
  else
    vim.cmd("cclose")
  end

  print("Errors: " .. total_errors .. " | Warnings: " .. total_warnings)
end

vim.api.nvim_create_user_command("RustCargoCheck", run_cargo_check, { desc = "Run cargo check" })
vim.keymap.set("n", "<c-x>c", ":RustCargoCheck<cr>")
