vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local bools = vim.api.nvim_get_hl(0, { name = "Boolean" })
    local all_hls = vim.api.nvim_get_hl(0, {})

    for name, _ in pairs(all_hls) do
      if type(name) == "string" and name:match("^@comment") then pcall(vim.api.nvim_set_hl, 0, name, bools) end
    end

    -- Also apply to standard Comment group
    pcall(vim.api.nvim_set_hl, 0, "Comment", bools)
  end,
})

--- @param current? string
local function set_colorscheme(current)
  current = current or "default"
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.cmd.colorscheme(current)
end

local colorschemes = {
  default = { "default", noreturn = true },
  github = {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({})
      set_colorscheme("github_dark_default")
    end,
  },
  kanagawa = {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
        background = { dark = "dragon", light = "lotus" },
        transparent = false,
        overrides = function(colors)
          local theme = colors.theme
          return {
            Comment = { fg = theme.ui.float.fg_border },
            ["@comment"] = { fg = theme.ui.float.fg_border },
            ["@comment.rust"] = { fg = theme.ui.float.fg_border },
          }
        end,
      })
      set_colorscheme("kanagawa")
    end,
  },
  clown = {
    "aktersnurra/no-clown-fiesta.nvim",
    config = function()
      require("no-clown-fiesta").setup({})

      set_colorscheme("no-clown-fiesta")
    end,
  },
}

local current = "clown"
local scheme = colorschemes[current]
if scheme.noreturn then
  set_colorscheme()
  return {}
else
  return colorschemes[current]
end
