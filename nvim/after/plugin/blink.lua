local ok, blink = pcall(require, "blink.cmp")
if not ok then
  return
end

local data_dir = vim.fn.stdpath("data")
local blink_dir = data_dir .. "/site/pack/core/opt/blink.cmp/"

local command = vim.system({ "cargo", "build", "--release" }, { cwd = blink_dir })
command:wait()

blink.setup({
  keymap = { preset = "default" },
  appearance = { nerd_font_variant = "mono" },
  completion = {
    list = {
      selection = { preselect = false, auto_insert = true },
      max_items = 10,
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = { border = "rounded" },
    },
    menu = {
      border = "rounded",
      draw = { gap = 2 },
    },
  },
  cmdline = { enabled = false },
  signature = { enabled = true },
})

vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities(nil, true) })
