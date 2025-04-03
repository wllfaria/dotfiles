--- @param current? string
local function set_colorscheme(current)
  current = current or "default"
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.cmd.colorscheme(current)

  local bools = vim.api.nvim_get_hl(0, { name = "Special" })
  local overrides = {
    "Comment",
    "@comment",
    "@comment.documentation",
    "comment",
  }

  for _, name in pairs(overrides) do
    --- @diagnostic disable-next-line
    vim.api.nvim_set_hl(0, name, bools)
  end
end

local colorschemes = {
  default = { "default", noreturn = true },
  kanagawa = {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
        background = { dark = "dragon", light = "lotus" },
        transparent = false,
      })
      set_colorscheme("kanagawa")
    end,
  },
}

local current = "kanagawa"
local scheme = colorschemes[current]
if scheme.noreturn then
  set_colorscheme()
  return {}
else
  return colorschemes[current]
end
