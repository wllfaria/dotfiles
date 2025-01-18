--- @param current string
local function set_colorscheme(current)
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.cmd.colorscheme(current)

  -- local bools = vim.api.nvim_get_hl(0, { name = "Boolean" })
  local overrides = {
    "Comment",
    "@comment",
    "@comment.documentation",
  }

  for _, name in pairs(overrides) do
    --- @diagnostic disable-next-line
    vim.api.nvim_set_hl(0, name, { fg = "#4f664f" })
  end
end

return {
  { "thimc/gruber-darker.nvim", enabled = false, config = function() set_colorscheme("gruber-darker") end },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    enabled = false,
    config = function()
      require("kanagawa").setup({
        -- colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
        background = { dark = "dragon", light = "lotus" },
        transparent = false,
      })
      set_colorscheme("kanagawa")
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function() set_colorscheme("tokyodark") end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function() set_colorscheme("tokyonight-night") end,
  },
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require("vague").setup({})
      set_colorscheme("vague")
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#121314", fg = "#cdcdcd" })
    end,
  },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    init = function() set_colorscheme("lackluster-hack") end,
  },
}
