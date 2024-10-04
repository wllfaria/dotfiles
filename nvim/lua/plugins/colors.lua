local function set_colorscheme()
  vim.o.background = "dark"
  vim.o.termguicolors = true
  local current = "gruber-darker"
  vim.cmd.colorscheme(current)
  local bools = vim.api.nvim_get_hl(0, { name = "Boolean" })
  --- @diagnostic disable-next-line
  vim.api.nvim_set_hl(0, "Comment", bools)
end

return {
  {
    "rose-pine/neovim",
    enabled = false,
    name = "rose-pine",
    priority = 1000,
    config = function() set_colorscheme() end,
  },
  { "thimc/gruber-darker.nvim", config = function() set_colorscheme() end },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    enabled = false,
    config = function()
      require("kanagawa").setup({
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
        background = {
          dark = "dragon",
          light = "lotus",
        },
        transparent = true,
      })
      set_colorscheme()
    end,
  },
}
