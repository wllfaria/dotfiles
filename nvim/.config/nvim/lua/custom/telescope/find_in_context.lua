local function find_nearest_project()
	local cwd = vim.fn.expand("%:p:h")
	local patterns = { "Cargo.toml", "package.json", "package-lock.json" }
	while cwd do
		for _, pattern in ipairs(patterns) do
			local file = cwd .. "/" .. pattern
			if vim.loop.fs_stat(file) then
				return cwd
			end
		end
		cwd = cwd:match("(.*)/")
	end
	return nil
end

local function find_in_project()
	local project_root = find_nearest_project()
	if not project_root then
		project_root = vim.fn.getcwd()
	end
	local opts = {
		prompt_title = "Find in project",
		cwd = project_root,
	}
	require("telescope.builtin").find_files(opts)
end

local function grep_in_project()
	local project_root = find_nearest_project()
	if not project_root then
		project_root = vim.fn.getcwd()
	end
	local opts = {
		prompt_title = "Grep in project",
		cwd = project_root,
	}
	require("telescope.builtin").live_grep(opts)
end

vim.keymap.set("n", "<leader>fpc", find_in_project)
vim.keymap.set("n", "<leader>flc", grep_in_project)
