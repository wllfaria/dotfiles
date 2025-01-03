local M = {}

local modes = {
  ["n"] = "Normal",
  ["no"] = "Normal",
  ["nov"] = "Normal",
  ["noV"] = "Normal",
  ["no"] = "Normal",
  ["niI"] = "Normal",
  ["niR"] = "Normal",
  ["niV"] = "Normal",
  ["v"] = "Visual",
  ["vs"] = "Visual",
  ["V"] = "Visual",
  ["Vs"] = "Visual",
  [""] = "Visual",
  ["s"] = "Visual",
  ["s"] = "Visual",
  ["S"] = "Visual",
  [""] = "Visual",
  ["i"] = "Insert",
  ["ic"] = "Insert",
  ["ix"] = "Insert",
  ["R"] = "Replace",
  ["Rc"] = "Replace",
  ["Rv"] = "Replace",
  ["Rx"] = "Replace",
  ["c"] = "Command",
  ["cv"] = "Command",
  ["ce"] = "Command",
  ["r"] = "Accepts",
  ["rm"] = "More",
  ["r?"] = "Confirm",
  ["!"] = "Terminal",
  ["t"] = "Terminal",
  ["nt"] = "Terminal",
  ["null"] = "none",
}

local separators = {
  left = "",
  right = "",
}

local component_separator = ""

local function get_mode()
  local curr_mode = vim.api.nvim_get_mode().mode
  local mode = " " .. modes[curr_mode] .. " "
  local formatted = ""
  if mode == " N " then
    formatted = "%#StatuslineModeNormal#" .. mode .. "%#StatuslineNormalSeparator#" .. separators.right
  elseif mode == " C " then
    formatted = "%#StatuslineModeCommand#" .. mode .. "%#StatuslineCommandSeparator#" .. separators.right
  elseif mode == " I " then
    formatted = "%#StatuslineModeInsert#" .. mode .. "%#StatuslineInsertSeparator#" .. separators.right
  elseif mode == " V " then
    formatted = "%#StatuslineModeVisual#" .. mode .. "%#StatuslineVisualSeparator#" .. separators.right
  else
    formatted = "%#StatuslineModeNormal#" .. mode .. "%#StatuslineNormalSeparator#" .. separators.right
  end

  return formatted
end

local function get_diagnostics()
  local diagnostics = {}
  local error = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR })
  local warns = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.HINT })
  local infos = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.INFO })

  if error > 0 then table.insert(diagnostics, "%#DiagnosticSignError#  " .. tostring(error)) end
  if warns > 0 then table.insert(diagnostics, "%#DiagnosticSignWarn#  " .. tostring(warns)) end
  if infos > 0 then table.insert(diagnostics, "%#DiagnosticSignInfo#  " .. tostring(infos)) end
  if hints > 0 then table.insert(diagnostics, "%#DiagnosticSignHint#  " .. tostring(hints)) end

  if #diagnostics == 0 then
    return ""
  else
    return "%#DiagnosticSignError# " .. table.concat(diagnostics, " ") .. " "
  end
end

local function get_git_branch()
  local branch = vim.trim(vim.system({ "git", "branch", "--show-current" }):wait().stdout)
  return "%#StatuslineGitBranch#" .. "  " .. branch
end

local file_icons = {
  lua = { hl = "%#FiletypeLua#", icon = " " },
  rs = { hl = "%#FiletypeRust#", icon = " " },
  toml = { hl = "%#FiletypeRust#", icon = " " },
  js = { hl = "%#FiletypeJs#", icon = "󰌞 " },
  ts = { hl = "%#FiletypeTs#", icon = "󰛦 " },
  javascriptreact = { hl = "%#FiletypeJs#", icon = " " },
  typescriptreact = { hl = "%#FiletypeTs#", icon = " " },
  ml = { hl = "%#FiletypeOcaml#", icon = " " },
  mli = { hl = "%#FiletypeOcaml#", icon = " " },
  dune = { hl = "%#FiletypeOcaml#", icon = " " },
  c = { hl = "%#FiletypeC#", icon = " " },
  go = { hl = "%#FiletypeGo#", icon = " " },
  dir = { hl = "%#FiletypeDir#", icon = " " },
  shell = { hl = "%#FiletypeRust#", icon = " " },
  none = { hl = "%#FileTypeNone#", icon = " " },
  ledger = { hl = "%#FileTypeLedger#", icon = "  " },
}

local function get_filename()
  local file_hl = "%#StatuslineFilename#"
  local filename = vim.fn.expand("%:t")
  local path = vim.fn.expand("%:r")
  local parent = vim.fn.fnamemodify(vim.fn.fnamemodify(path, ":h"), ":t")
  local extension = vim.fn.expand("%:e")
  local is_dir = vim.api.nvim_get_option_value("filetype", { buf = 0 }) == "netrw"
  local icon = file_icons[extension]
  local file_icon = ""

  if filename == "" then return " " .. file_icons.dir.hl .. file_icons.dir.icon .. file_hl .. parent .. " " end

  if not icon then
    file_icon = " " .. file_icons.none.hl .. file_icons.none.icon
  else
    file_icon = " " .. icon.hl .. icon.icon
  end

  if is_dir then file_icon = " " .. file_icons.dir.hl .. file_icons.dir.icon end
  if filename:match("zsh") then file_icon = " " .. file_icons.shell.hl .. file_icons.shell.icon end

  return file_icon .. file_hl .. parent .. "/" .. filename .. " "
end

local function get_cursor()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local cursor_str = table.concat(cursor, ":")
  return "%#StatuslineCursor#" .. cursor_str .. " "
end

local function get_line_percentage()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1]
  local total_lines = vim.api.nvim_buf_line_count(0)
  local hl = "%#StatuslineCursorPercent#"
  if line == 1 then
    return hl .. " TOP  "
  elseif line == total_lines then
    return hl .. " BOT  "
  else
    local percent = string.format("%d", line / total_lines * 100)
    return hl .. " " .. percent .. "󱉸  "
  end
end

M.left = function()
  local mode = get_mode()
  local separator = component_separator
  local diagnostics = get_diagnostics()
  local filename = get_filename()
  local branch = get_git_branch()
  local reset = "%#StatuslineReset#"

  local components = {
    mode,
    branch,
    filename,
    diagnostics,
    reset,
  }
  local left = table.concat(components, separator)
  return left
end

M.right = function()
  local separator = component_separator
  local lines_percentage = get_line_percentage()
  local cursor = get_cursor()

  local components = {
    lines_percentage,
    cursor,
  }

  local right = table.concat(components, separator)
  return right .. separator
end

return M
