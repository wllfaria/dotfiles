--- @param output string[]
local function parse_cargo_check_output(output)
  local qf_items = {}
  local error_count = 0
  local warning_count = 0

  for idx, line in ipairs(output) do
    if line:match("^error") then
      error_count = error_count + 1
      local prefix = "  -->"
      local filename_line = output[idx + 1]

      local trimmed = filename_line:sub(#prefix + 2):gsub("%s+", "") -- Remove spaces
      local file, line_num, col_num = trimmed:match("(.+):(%d+):(%d+)")

      if file and line_num and col_num then
        table.insert(qf_items, {
          filename = file,
          lnum = tonumber(line_num),
          col = tonumber(col_num),
          text = line,
          type = "E",
        })
      end
    elseif line:find("^warning") then
      warning_count = warning_count + 1
    end
  end

  if #qf_items == 0 then vim.cmd("cclose") end

  if #qf_items > 0 then
    vim.fn.setqflist(qf_items)
    vim.cmd("copen 6")
  end

  local status = "'E: " .. error_count .. " | W: " .. warning_count .. "'"
  vim.cmd.echo(status)
end

local function run_cargo_check()
  print("running cargo check...")
  vim.fn.jobstart({ "cargo", "check", "--workspace" }, {
    stderr_buffered = true,
    on_stderr = function(_, data, _)
      if data then parse_cargo_check_output(data) end
    end,
  })
end

vim.keymap.set("n", "<c-x>", function() run_cargo_check() end)
