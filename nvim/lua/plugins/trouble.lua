return {
  "folke/trouble.nvim",
  lazy = true,
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
  config = function()
    require("trouble").setup({
      follow = false,
      auto_preview = false,
      focus = true,
      indent_guides = false,
      warn_no_results = false,
      modes = {
        diagnostics = {
          win = { size = 0.3 },
          filter = function(items)
            local severity = vim.diagnostic.severity.HINT
            for _, item in ipairs(items) do
              severity = math.min(severity, item.severity)
            end
            return vim.tbl_filter(function(item) return item.severity == severity end, items)
          end,
        },
      },
    })

    vim.api.nvim_set_hl(0, "TroubleNormal", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TroubleNormalNC", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TroubleIndent", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TroubleIndentFoldClosed", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TroublePos", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TabLineSel", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TroublePreview", { link = "Normal" })
  end,
}
