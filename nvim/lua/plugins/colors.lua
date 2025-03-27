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
  gruber_darker = {
    "thimc/gruber-darker.nvim",
    config = function() set_colorscheme("gruber-darker") end,
  },
  kanagawa = {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        -- colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
        background = { dark = "dragon", light = "lotus" },
        transparent = false,
      })
      set_colorscheme("kanagawa")
    end,
  },
  tokyodark = {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000,
    config = function() set_colorscheme("tokyodark") end,
  },
  tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() set_colorscheme("tokyonight-day") end,
  },
  vague = {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({})
      set_colorscheme("vague")
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#121314", fg = "#cdcdcd" })
    end,
  },
  lackluster = {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function() set_colorscheme("lackluster-hack") end,
  },
  github = {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({})
      set_colorscheme("github_light")
    end,
  },
  gruvbox = {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({})
      set_colorscheme("gruvbox")
    end,
  },
  autumn_night = {
    dir = "~/code/autumn_night.nvim",
    priority = 1000,
    dev = true,
    config = function() set_colorscheme("autumn_night") end,
  },
}

local current = "autumn_night"
local scheme = colorschemes[current]
if scheme.noreturn then
  set_colorscheme()
  return {}
else
  return colorschemes[current]
end
