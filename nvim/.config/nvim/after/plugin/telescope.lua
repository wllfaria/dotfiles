local Color = require("colors");
local colors = Color.current_theme_colors()

vim.opt.fillchars = { vert = '│', horiz = '─' }
vim.api.nvim_set_hl(0, "TelescopePromptNormal", Color.transparent and { bg = nil } or { bg = colors.color_0 })
vim.api.nvim_set_hl(0, "TelescopePromptBorder",
    Color.transparent and { bg = nil, fg = colors.color_1 } or { bg = colors.color_0, fg = colors.color_1 })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder",
    Color.transparent and { bg = nil, fg = colors.color_1 } or { bg = colors.color_0, fg = colors.color_1 })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder",
    Color.transparent and { bg = nil, fg = colors.color_1 } or { bg = colors.color_0, fg = colors.color_1 })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", Color.transparent and { bg = nil } or { bg = colors.color_0 })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", Color.transparent and { bg = nil } or { bg = colors.color_0 })
vim.api.nvim_set_hl(0, "TelescopePromptCounter", Color.transparent and { bg = nil } or { bg = colors.color_0 })

---@param consider_selection boolean
local function git_link(consider_selection)
    local git_rev = vim.trim(vim.system({ "git", "rev-parse", "HEAD" }):wait().stdout)
    local git_root = vim.trim(vim.system({ "git", "rev-parse", "--show-toplevel" }):wait().stdout)
    local path = vim.fn.expand("%:p"):sub(#git_root + 1)
    local lines = {}

    if consider_selection then
        local pos_v = vim.fn.getpos("v")
        local pos_c = vim.fn.getpos(".")

        lines = {
            { pos_v[2], pos_v[3] },
            { pos_c[2], pos_c[3] },
        }

        table.sort(lines, function(a, b)
            return a[1] < b[1]
        end)

        lines[2][2] = lines[2][2] + 1
    end

    local mode = vim.api.nvim_get_mode()

    ---@param url string
    ---
    ---@return string url
    local get_url = function(url)
        if not vim.startswith(url, "http") then
            url = vim.fn.substitute(url, "\\v\\w+\\@(.*):(.*)", "https:\\/\\/\\1\\/\\2", "")
        end

        local is_github = false

        if url:match("github.com") then
            is_github = true
        end

        if vim.endswith(url, ".git") then
            url = url:sub(1, #url - 4)
        end

        if is_github then
            url = url .. "/blob/" .. git_rev .. path
        else
            url = url .. "/tree/" .. git_rev .. "/item" .. path
        end

        if not consider_selection then
            return string.format("%s", url)
        end

        if not is_github then
            return string.format("%s#L%d-%d", url, lines[1][1], lines[2][1])
        end

        if mode == "V" then
            return string.format("%s#L%d-L%d", url, lines[1][1], lines[2][1])
        end

        return string.format(
            "%s#L%dC%d-L%dC%d",
            url,
            lines[1][1],
            lines[1][2],
            lines[2][1],
            lines[2][2]
        )
    end

    ---@param url string
    local handle_url = function(url)
        vim.ui.select({
            { target = "browser",   text = "Open in Browser" },
            { target = "clipboard", text = "Copy to Clipboard" },
        }, {
            format_item = function(item)
                return item.text
            end,
        }, function(choice)
            if choice.target == "browser" then
                vim.ui.open(url)
            else
                vim.fn.setreg("+", url)
                vim.notify("Copied URL to clipboard.")
            end
        end)
    end

    vim.system({ "git", "remote", "-v" }, {}, vim.schedule_wrap(function(result)
        if result.code ~= 0 then
            error("failed to get git remotes: " .. result.stderr)
        end

        local urls = {}

        for line in vim.gsplit(result.stdout, "\n", { trimempty = true }) do
            local parts = vim.split(line, "\t")
            local url = vim.split(parts[2], " ")[1]

            if not vim.tbl_contains(urls, url) then
                table.insert(urls, url)
            end
        end

        if #urls == 1 then
            handle_url(get_url(urls[1]))
        else
            vim.ui.select(urls, {}, function(choice)
                handle_url(get_url(choice))
            end)
        end
    end))
end

vim.keymap.set("v", "gl", function()
    git_link(true)
end)

vim.keymap.set("n", "<Leader>gl", function()
    git_link(false)
end)
