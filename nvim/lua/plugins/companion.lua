return {
  "olimorris/codecompanion.nvim",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" },
    },
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "ollama",
        },
        inline = {
          adapter = "ollama",
        },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "http://127.0.0.1:1234",
              chat_url = "/v1/chat/completions",
            },
          })
        end,
      },
    })

    require("render-markdown").setup({
      code = {
        sign = true,
        style = "language",
        above = " ",
        below = " ",
      },
    })

    vim.keymap.set("n", "<C-a>", "<cmd>CodeCompanionActions<cr>")
    vim.keymap.set("v", "<C-a>", "<cmd>CodeCompanionActions<cr>")
    vim.keymap.set("n", "<M-a>", "<cmd>CodeCompanionChat Toggle<cr>")
    vim.keymap.set("v", "<M-a>", "<cmd>CodeCompanionChat Toggle<cr>")
    vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>")
    vim.cmd([[cab cc CodeCompanion]])
  end,
}
