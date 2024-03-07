local M = {}

local modes = {
    ["n"] = "N",
    ["no"] = "N",
    ["nov"] = "N",
    ["noV"] = "N",
    ["no"] = "N",
    ["niI"] = "N",
    ["niR"] = "N",
    ["niV"] = "N",
    ["v"] = "V",
    ["vs"] = "V",
    ["V"] = "V",
    ["Vs"] = "V",
    [""] = "V",
    ["s"] = "V",
    ["s"] = "V",
    ["S"] = "V",
    [""] = "V",
    ["i"] = "I",
    ["ic"] = "I",
    ["ix"] = "I",
    ["R"] = "R",
    ["Rc"] = "R",
    ["Rv"] = "R",
    ["Rx"] = "R",
    ["c"] = "C",
    ["cv"] = "C",
    ["ce"] = "C",
    ["r"] = "Accepts",
    ["rm"] = "More",
    ["r?"] = "Confirm",
    ["!"] = "T",
    ["t"] = "T",
    ["nt"] = "T",
    ["null"] = "none",
}

local separators = {
    left = "",
    right = "",
}

M.component_separator = " "

M.get_mode = function()
    local curr_mode = vim.api.nvim_get_mode().mode
    local mode = " " .. modes[curr_mode] .. " "
    local formatted = ""
    if mode == " N " then
        formatted = "%#StatuslineModeNormal#" .. mode .. "%#StatuslineNormalSeparator#" .. separators.right
    elseif mode == " C " then
        formatted = "%#StatuslineModeCommand#" .. mode .. "%#StatuslineCommandSeparator#" .. separators.right
    elseif mode == " I " then
        formatted = "%#StatuslineModeInsert#" .. mode .. "%#StatuslineInsertSeparator#" .. separators.right
    elseif mode == " V " then
        formatted = "%#StatuslineModeVisual#" .. mode .. "%#StatuslineVisualSeparator#" .. separators.right
    else
        formatted = "%#StatuslineModeNormal#" .. mode .. "%#StatuslineNormalSeparator#" .. separators.right
    end

    return formatted
end

M.get_diagnostics = function()
    local diagnostics = {}
    local error = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR })
    local warns = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.WARN })
    local hints = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.HINT })
    local infos = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.INFO })

    if error > 0 then
        table.insert(diagnostics, "%#DiagnosticSignError#󰅚  " .. tostring(error))
    end
    if warns > 0 then
        table.insert(diagnostics, "%#DiagnosticSignWarn#󰀪  " .. tostring(warns))
    end
    if infos > 0 then
        table.insert(diagnostics, "%#DiagnosticSignInfo#󰋽  " .. tostring(infos))
    end
    if hints > 0 then
        table.insert(diagnostics, "%#DiagnosticSignHint#󰌶  " .. tostring(hints))
    end

    return table.concat(diagnostics, " ")
end

M.get_git_branch = function()
    local branch = vim.trim(vim.system({ "git", "branch", "--show-current" }):wait().stdout)
    return "%#StatusLineGitBranch#" .. " " .. branch
end

local file_icons = {
    lua  = { hl = "%#FiletypeLua#", icon = " " },
    rs   = { hl = "%#FiletypeRust#", icon = " " },
    js   = { hl = "%#FiletypeJs#", icon = "󰌞 " },
    ts   = { hl = "%#FiletypeTs#", icon = "󰛦 " },
    ml   = { hl = "%#FiletypeOcaml#", icon = " " },
    mli  = { hl = "%#FiletypeOcaml#", icon = " " },
    c    = { hl = "%#FiletypeC#", icon = " " },
    go   = { hl = "%#FiletypeGo#", icon = " " },
    dir  = { hl = "%#FiletypeDir#", icon = " " },
    none = { hl = "%#FileTypeNone#", icon = " " }
}

M.get_filename = function()
    local filename = vim.fn.expand("%:t")
    local path = vim.fn.expand("%:r")
    local parent = vim.fn.fnamemodify(vim.fn.fnamemodify(path, ":h"), ":t")

    local file_hl = "%#StatusLineFilename#"

    local extension = vim.fn.expand("%:e")
    local icon = file_icons[extension]
    local file_icon = ""

    if filename == "" then
        return file_icons.dir.hl .. file_icons.dir.icon .. file_hl .. parent
    end

    if not icon then
        file_icon = file_icons.none.hl .. file_icons.none.icon
    else
        file_icon = icon.hl .. icon.icon
    end

    return file_icon .. file_hl .. parent .. "/" .. filename
end

M.get_cursor = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local cursor_str = table.concat(cursor, ":")
    return "%#StatusLineCursor#" .. cursor_str
end

M.get_line_percentage = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line = cursor[1]
    local total_lines = vim.api.nvim_buf_line_count(0)
    local hl = "%#StatusLineCursorPercent#"
    if line == 1 then
        return hl .. "TOP  "
    elseif line == total_lines then
        return hl .. "BOT  "
    else
        local percent = string.format("%d", line / total_lines * 100)
        return hl .. percent .. "󱉸  "
    end
end

return M
