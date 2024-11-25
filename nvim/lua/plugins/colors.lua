local function set_colorscheme()
  vim.o.background = "dark"
  vim.o.termguicolors = true
  local current = "vague"
  vim.cmd.colorscheme(current)
  local bools = vim.api.nvim_get_hl(0, { name = "Boolean" })
  --- @diagnostic disable-next-line
  vim.api.nvim_set_hl(0, "Comment", bools)
end

return {
  { "thimc/gruber-darker.nvim", enabled = false, config = function() set_colorscheme() end },
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
      set_colorscheme()
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function() set_colorscheme() end,
  },
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      require("vague").setup({})
      set_colorscheme()
    end,
  },
}
