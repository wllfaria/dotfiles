require("core.helpers.globals")

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- Luasnip expand
				end,
			},

			mapping = {

				-- Autocompletion menu
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i" }),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),

				-- Use <C-e> to abort autocomplete
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(), -- Abort completion
					c = cmp.mapping.close(), -- Close completion window
				}),

				-- Use <Tab> and <S-Tab> to navigate through completion variants
				["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i" }),
				["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP
				{ name = "nvim_lsp_signature_help" }, -- LSP for parameters in functions
				{ name = "nvim_lua" }, -- Lua Neovim API
				{ name = "buffer" }, -- Buffers
				{ name = "path" }, -- Paths
			}, {}),
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
