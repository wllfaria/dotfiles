local function set_colorscheme()
  vim.o.background = "dark"
  vim.o.termguicolors = true
  local current = "tokyodark"
  vim.cmd.colorscheme(current)
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
    enabled = true,
    config = function()
      require("tokyodark").setup({})
      set_colorscheme()
    end,
  },
}
