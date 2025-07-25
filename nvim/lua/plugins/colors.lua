vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local bools = vim.api.nvim_get_hl(0, { name = "Boolean" })
    local all_hls = vim.api.nvim_get_hl(0, {})

    for name, _ in pairs(all_hls) do
      if type(name) == "string" and name:match("^@comment") then
        pcall(vim.api.nvim_set_hl, 0, name, bools)
      end
    end

    -- Also apply to standard Comment group
    pcall(vim.api.nvim_set_hl, 0, "Comment", bools)
  end,
})

--- @param current? string
local function set_colorscheme(current)
  current = current or "default"
  vim.o.termguicolors = true
  vim.cmd.colorscheme(current)
end

local colorschemes = {
  default = { "default", noreturn = true },
  clown = {
    "aktersnurra/no-clown-fiesta.nvim",
    config = function()
      require("no-clown-fiesta").setup({})
      set_colorscheme("no-clown-fiesta")
    end,
  },
  vague = {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({})
      set_colorscheme("vague")
    end,
  },
  vesper = {
    "datsfilipe/vesper.nvim",
    config = function()
      require("vesper").setup({
        transparent = false,
        overrides = {
          ColorColumn = { link = "TabLine" },
        },
      })
      set_colorscheme("vesper")
    end,
  },
  gruber_darker = {
    "blazkowolf/gruber-darker.nvim",
    config = function()
      -- require("gruber-darker").setup({})
      set_colorscheme("gruber-darker")
    end,
  },
  zenbones = {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "light"
      set_colorscheme("rosebones")
    end,
  },
  tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({})
      set_colorscheme("tokyonight-night")
    end,
  },
  doom = {
    "NTBBloodbath/doom-one.nvim",
    config = function()
      vim.g.doom_one_cursor_coloring = true
      vim.g.doom_one_terminal_colors = true
      vim.g.doom_one_enable_treesitter = true

      vim.g.doom_one_pumblend_enable = true
      vim.g.doom_one_pumblend_transparency = 20

      vim.g.doom_one_plugin_telescope = true
      vim.g.doom_one_plugin_neogit = true

      set_colorscheme("doom-one")
    end,
  },
}

local current = "doom"
local scheme = colorschemes[current]
if scheme.noreturn then
  set_colorscheme()
  return {}
else
  return colorschemes[current]
end
