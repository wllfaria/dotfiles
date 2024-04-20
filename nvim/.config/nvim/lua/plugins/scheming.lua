return {
  dir = '~/code/personal/scheming',
  -- "wllfaria/scheming.nvim",
  config = function()
    local scheming = require 'scheming'

    local function to_hex(int)
      return string.format('#%06x', int)
    end
    vim.g.adwaita_darker = true

    local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
    local marked = vim.api.nvim_get_hl(0, { name = 'PMenu' })
    local colors = {
      normal = '#B77EE0',
      command = '#FB7373',
      visual = '#5FB0FC',
      dim = to_hex(vim.api.nvim_get_hl(0, { name = 'Comment' }).fg),
      insert = '#FCCF67',
      white = '#FFFFFF',
      blue = '#5FB0FC',
      yellow = '#FCCF67',
      magenta = '#B77EE0',
      red = '#FB7373',
      green = '#36C692',
    }

    scheming.setup {
      mappings = { toggle = { '<leader>sc' } },
      schemes = {
        radium = {
          package_name = 'colors.radium',
        },
        'ayu',
        miasma = {},
        'rose-pine',
        'catppuccin',
        'tokyodark',
        tokyonight = {
          style = 'moon',
        },
        'vscode',
        'gruvbuddy',
        'midnight',
        'cyberdream',
        'moonfly',
        gruvbox = {
          contrast = 'hard',
        },
        'base16-gruvbox-dark-hard',
        'oxocarbon',
        'adwaita',
        'hotdog',

        'github_dark_high_contrast',
        'github_dark_default',
        'github_dark_dimmed',
      },
      override_hl = {
        StatusLineModeNormal = { bg = colors.normal, fg = colors.white },
        StatusLineNormalSeparator = { bg = nil, fg = colors.normal },
        StatusLineModeCommand = { bg = colors.command, fg = colors.white },
        StatusLineCommandSeparator = { bg = nil, fg = colors.command },
        StatusLineModeInsert = { bg = colors.insert, fg = colors.white },
        StatusLineInsertSeparator = { bg = nil, fg = colors.insert },
        StatusLineModeVisual = { bg = colors.visual, fg = colors.white },
        StatusLineVisualSeparator = { bg = nil, fg = colors.visual },
        StatusLineGitBranch = { bg = nil, fg = colors.green },
        StatusLineFilename = { bg = nil, fg = colors.dim },
        StatusLineCursor = { bg = nil, fg = colors.green },
        StatusLineCursorPercent = { bg = nil, fg = colors.normal },
        StatusLineReset = { bg = nil, fg = nil },
        DiagnosticSignError = { bg = nil, fg = colors.red },
        DiagnosticSignWarn = { bg = nil, fg = colors.yellow },
        DiagnosticSignInfo = { bg = nil, fg = colors.blue },
        DiagnosticSignHint = { bg = nil, fg = colors.blue },

        FiletypeLua = { bg = nil, fg = colors.blue },
        FiletypeRust = { bg = nil, fg = colors.yellow },
        FiletypeJs = { bg = nil, fg = colors.yellow },
        FiletypeTs = { bg = nil, fg = colors.blue },
        FiletypeOcaml = { bg = nil, fg = colors.yellow },
        FiletypeC = { bg = nil, fg = colors.blue },
        FiletypeGo = { bg = nil, fg = colors.blue },
        FiletypeGleam = { bg = nil, fg = colors.magenta },
        FileTypeElixir = { bg = nil, fg = colors.magenta },
        FiletypeDir = { bg = nil, fg = colors.yellow },
        FiletypeNone = { bg = nil, fg = colors.red },
        Comments = { bg = bools.bg, fg = bools.fg },
        LspSignatureActiveParameter = { fg = marked.fg, bg = marked.bg, bold = true },
      },
    }
  end,
}
