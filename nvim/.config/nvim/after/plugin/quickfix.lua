--- @class QfItem
--- @field filename string
--- @field lnum number
--- @field col number
--- @field text string
--- @field severity string

local type_of_list = ""
local cmd_id = nil

local function maybe_del_autocmd()
    if cmd_id ~= nil then
        vim.api.nvim_del_autocmd(cmd_id)
        cmd_id = nil
    end
end

--- Clear the quickfix list
local function clear_qf()
    vim.fn.setqflist({}, 'r')
end

--- Closes the quickfix list
local function close_qf()
    maybe_del_autocmd()
    vim.cmd("cclose")
end

--- Produces an item to be added to the quickfix list
--- @param entry vim.Diagnostic
--- @return QfItem item
local function diagnostic_entry(entry)
    return {
        filename = vim.fn.bufname(entry.bufnr),
        lnum = entry.lnum + 1,
        col = entry.col + 1,
        text = entry.message,
        severity = vim.diagnostic.severity[entry.severity]
    }
end

--- Populates and open the quickfix list with the provided list
---
--- @param title string
--- @param list string[]
local function populate(title, list)
    if #list == 0 then
        print("Nothing to show")
        return
    end

    vim.fn.setqflist({}, ' ', {
        title = title,
        items = list,
    })
    vim.cmd('copen')
end

--- Populates the quickfix list with all diagnostics for the current workspace
local function diagnostics_to_qf()
    clear_qf()
    local diagnostics = vim.diagnostic.get()
    local qf_list = {} --- @type string[]

    for _, entry in ipairs(diagnostics) do
        local item = diagnostic_entry(entry)
        table.insert(qf_list, item)
    end

    populate("Diagnostics", qf_list)
end

--- Populates the quickfix list with diagnostics that match the given severity level
--- @param level vim.diagnostic.Severity
local function filtered_to_qf(level)
    clear_qf()
    local diagnostics = vim.diagnostic.get()
    local qf_list = {}

    for _, entry in ipairs(diagnostics) do
        if entry.severity == level then
            local item = diagnostic_entry(entry)
            table.insert(qf_list, item)
        end
    end

    populate("Warnings", qf_list)
end

local function todo_to_qf()
    local langs = { "rust", "js", "ts", "cpp", "c", "asm", "go", "ocaml" }
    local cmd = "'TODO:\\|FIXME:\\|HACK:'"
    for _, lang in ipairs(langs) do
        cmd = cmd .. " --type " .. lang
    end
    vim.cmd("silent! grep! " .. cmd)
    vim.cmd("copen")
end

--- Creates an autocommand to refresh the list everytime an item of the list changes
--- so we always get the last updates
local function make_autocmd()
    maybe_del_autocmd()
    local items = vim.fn.getqflist()
    local patterns = {}
    local filetypes = {}
    for _, item in ipairs(items) do
        local buffer = item.bufnr
        local filename = vim.api.nvim_buf_get_name(buffer)
        local extension = vim.fn.fnamemodify(filename, ":e")
        if not filetypes[extension] then
            filetypes[extension] = true
            table.insert(patterns, "*." .. extension)
        end
    end

    if #patterns > 0 then
        local id = vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = patterns,
            callback = function()
                if type_of_list == "diagnostics" then
                    diagnostics_to_qf()
                elseif type_of_list == "warn" then
                    filtered_to_qf(vim.diagnostic.severity.WARN)
                elseif type_of_list == "error" then
                    filtered_to_qf(vim.diagnostic.severity.ERROR)
                elseif type_of_list == "todo" then
                    todo_to_qf()
                end
            end
        })
        cmd_id = id
    end
end

vim.keymap.set("n", "<leader>qq", function()
    close_qf()
end)

vim.keymap.set("n", "<leader>qf", function()
    diagnostics_to_qf()
    type_of_list = "diagnostics"
    make_autocmd()
end)

vim.keymap.set("n", "<leader>qw", function()
    type_of_list = "warns"
    filtered_to_qf(vim.diagnostic.severity.WARN)
    make_autocmd()
end)

vim.keymap.set("n", "<leader>qe", function()
    type_of_list = "error"
    filtered_to_qf(vim.diagnostic.severity.ERROR)
    make_autocmd()
end)

vim.keymap.set("n", "<leader>qt", function()
    type_of_list = "todo"
    todo_to_qf()
    make_autocmd()
end)
