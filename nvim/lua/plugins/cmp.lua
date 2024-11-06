return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  enabled = true,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local cmp = require("cmp")
    local ls = require("luasnip")

    cmp.setup({
      -- completion = { enabled = false },
      snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      },
      mapping = {
        ["<C-x><C-o>"] = cmp.mapping.complete(),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i" }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
        ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i" }),
        ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "ledger" },
        { name = "path" },
      },
    })

    for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
      loadfile(ft_path)()
    end

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.expand_or_jumpable() then ls.expand_or_jump() end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.jumpable(-1) then ls.jump(-1) end
    end, { silent = true })
  end,
}
