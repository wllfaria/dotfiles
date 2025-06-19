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

  -- if current == "default" then vim.api.nvim_set_hl(0, "Normal", { bg = nil }) end
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
}

local current = "vesper"
local scheme = colorschemes[current]
if scheme.noreturn then
  set_colorscheme()
  return {}
else
  return colorschemes[current]
end
