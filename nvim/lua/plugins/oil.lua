return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup()

		vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
		vim.keymap.set("n", "-", "<CMD>Oil<CR>")
	end,
}
