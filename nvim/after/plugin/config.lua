---@alias HighlightTable table<string, vim.api.keyset.highlight>

local function follow_links(group)
  if not group.link then return group end
  local new_group = vim.api.nvim_get_hl(0, { name = group.link })
  return follow_links(new_group)
end

---@param highlight string
---@return vim.api.keyset.highlight
local function get_highlight(highlight)
  local group = vim.api.nvim_get_hl(0, { name = highlight })
  group = follow_links(group)

  for key, opt in pairs(group) do
    if type(opt) == "number" then group[key] = string.format("#%06x", opt) end
  end
  return group ---@type vim.api.keyset.highlight
end

--- @type HighlightTable
local colorscheme_hl = {
  ["Normal"] = get_highlight("Normal"),
  ["Function"] = get_highlight("Function"),
  ["CursorColumn"] = get_highlight("CursorColumn"),
  ["DiagnosticError"] = get_highlight("DiagnosticSignError"),
  ["DiagnosticWarn"] = get_highlight("DiagnosticSignWarn"),
  ["DiagnosticInfo"] = get_highlight("DiagnosticSignInfo"),
  ["DiagnosticHint"] = get_highlight("DiagnosticSignHint"),
  ["DiagnosticOk"] = get_highlight("DiagnosticSignOk"),
  ["Define"] = get_highlight("Define"),
}

--- @type HighlightTable
local highlights = {
  ["StatuslineModeNormal"] = { fg = colorscheme_hl["Normal"].bg, bg = colorscheme_hl["DiagnosticInfo"].fg },
  ["StatuslineModeInsert"] = { fg = colorscheme_hl["Function"].fg, bg = colorscheme_hl["Function"].bg },
  ["StatusLineModeVisual"] = { fg = colorscheme_hl["Define"].fg, bg = colorscheme_hl["DiagnosticError"].bg },
  ["StatuslineModeCommand"] = { fg = colorscheme_hl["DiagnosticError"].fg, bg = colorscheme_hl["DiagnosticError"].bg },
  ["DiagnosticSignError"] = { fg = colorscheme_hl["DiagnosticError"].fg, bg = colorscheme_hl["Normal"].bg },
  ["DiagnosticSignWarn"] = { fg = colorscheme_hl["DiagnosticWarn"].fg, bg = colorscheme_hl["Normal"].bg },
  ["DiagnosticSignInfo"] = { fg = colorscheme_hl["DiagnosticInfo"].fg, bg = colorscheme_hl["Normal"].bg },
  ["DiagnosticSignHint"] = { fg = colorscheme_hl["DiagnosticHint"].fg, bg = colorscheme_hl["Normal"].bg },
  ["FiletypeLua"] = { fg = "#1565C0", bg = colorscheme_hl["CursorColumn"].bg },
  ["FiletypeRust"] = { fg = "#e43716", bg = colorscheme_hl["CursorColumn"].bg },
  ["FiletypeJs"] = { fg = "#FFD600", bg = colorscheme_hl["CursorColumn"].bg },
  ["FiletypeTs"] = { fg = "#1976D2", bg = colorscheme_hl["CursorColumn"].bg },
  ["FiletypeLedger"] = { fg = colorscheme_hl["DiagnosticOk"].fg },
  ["FiletypeOcaml"] = { fg = "#F29100", bg = colorscheme_hl["CursorColumn"].bg },
  ["FiletypeC"] = { fg = "#283593", bg = colorscheme_hl["CursorColumn"].bg },
  ["FiletypeGo"] = { fg = "#FFCC80", bg = colorscheme_hl["CursorColumn"].bg },
  ["FiletypeDir"] = { fg = "#FFA000", bg = colorscheme_hl["CursorColumn"].bg },
  ["FiletypeNone"] = { fg = "#90CAF9", bg = colorscheme_hl["Function"].fg },
  ["StatuslineReset"] = { fg = colorscheme_hl["Normal"].bg, bg = colorscheme_hl["Normal"].bg },
  ["StatuslineGitBranch"] = { fg = colorscheme_hl["DiagnosticOk"].fg, bg = colorscheme_hl["CursorColumn"].bg },
  ["StatuslineCursor"] = { fg = colorscheme_hl["Normal"].bg, bg = colorscheme_hl["Function"].fg },
  ["StatuslineFilename"] = { fg = colorscheme_hl["Function"].fg, bg = colorscheme_hl["CursorColumn"].bg },
  ["StatuslineCursorPercent"] = { fg = colorscheme_hl["Normal"].bg, bg = colorscheme_hl["Function"].fg },
}

for highlight, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, highlight, opts)
end

vim.opt.fillchars = { vert = "│", horiz = "─" }
