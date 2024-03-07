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

--- Populates quickfix list with all the comments containing:
--- * TODO:
--- * FIXME:
--- * HACK:
local function todo_to_qf()
    clear_qf()

    local patterns = { "TODO:", "FIXME:", "HACK:" }
    local filetype = { "*.js", "*.ts", "*.tsx", "*.s", "*.c", "*.cpp", "*.cc", "*.ml", "*.mli", "*.go", }
    local type_str = ""
    for _, type in ipairs(filetype) do
        type_str = type_str .. ' -o -name "' .. type .. '"'
    end
    local find_cmd = "find . -type f \\( -name '*.rs'" .. type_str .. " \\) -exec grep -HnE '%s' {} +"

    local grep_tbl = table.concat(patterns, '|')
    local grep_cmd = string.format(find_cmd, grep_tbl)

    local on_stdout = function(_, data, _)
        if not data then return end
        local qf_list = {}
        for _, line in ipairs(data) do
            if line ~= "" then -- ignore empty lines
                local file, lnum, text = line:match("([^:]+):(%d+):(.*)")
                -- ignore anything that is missing all the patterns
                -- just in case it captures something wrong
                if file and lnum and text then
                    table.insert(qf_list, {
                        filename = file,
                        lnum = tonumber(lnum),
                        text = text
                    })
                end
            end
        end

        if #qf_list > 0 then
            populate("Todos", qf_list)
        end
    end

    vim.fn.jobstart(grep_cmd, {
        on_stdout = on_stdout,
        stdout_buffered = true
    })
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
    todo_to_qf()
end)
