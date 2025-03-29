return {
  "saghen/blink.cmp",
  lazy = false,
  version = "v1.*",
  enabled = true,
  opts = {
    keymap = { preset = "default" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    completion = {
      list = { selection = { preselect = false, auto_insert = true } },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
        },
      },
      menu = {
        border = "rounded",
        draw = { gap = 2 },
      },
    },
    signature = { enabled = true },
  },
}
