local utils = require("custom.utils")

local M = {}

M.left = function()
    local mode = utils.get_mode()
    local separator = utils.component_separator
    local diagnostics = utils.get_diagnostics()
    local filename = utils.get_filename()
    local branch = utils.get_git_branch()

    local components = {
        mode,
        branch,
        filename,
        diagnostics,
    }
    local left = table.concat(components, separator)
    return left
end

M.right = function()
    local separator = utils.component_separator
    local lines_percentage = utils.get_line_percentage()
    local cursor = utils.get_cursor()

    local components = {
        lines_percentage,
        cursor,
    }

    local right = table.concat(components, separator)
    return right .. separator
end

return M
