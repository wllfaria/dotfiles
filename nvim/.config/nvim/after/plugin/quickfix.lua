--- @class QfItem
--- @field filename string
--- @field lnum number
--- @field col number
--- @field text string
--- @field severity string

--- Clear the quickfix list.
local function clear_qf()
    vim.fn.setqflist({}, 'r')
    vim.cmd('cclose')
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
        print(entry.severity)
        if entry.severity == level then
            local item = diagnostic_entry(entry)
            table.insert(qf_list, item)
        end
    end

    populate("Warnings", qf_list)
end

vim.keymap.set("n", "<leader>qq", function()
    clear_qf()
end)

vim.keymap.set("n", "<leader>qf", function()
    diagnostics_to_qf()
end)

vim.keymap.set("n", "<leader>qw", function()
    filtered_to_qf(2)
end)

vim.keymap.set("n", "<leader>qe", function()
    filtered_to_qf(1)
end)

vim.keymap.set("n", "<leader>qt", function()
    local langs = { "rust", "js", "ts", "cpp", "c", "asm", "go", "ocaml" }
    local cmd = "'TODO:\\|FIXME:\\|HACK:'"
    for _, lang in ipairs(langs) do
        cmd = cmd .. " --type " .. lang
    end
    vim.cmd("silent! grep! " .. cmd)
    vim.cmd("copen")
end)
