return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      ignore_install = {},
      modules = {},
      auto_install = true,
      ensure_installed = {
        'lua',
        'typescript',
        'javascript',
        'rust',
        'markdown',
        'vimdoc',
        'markdown_inline',
        'ocaml',
        'json',
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }

    require('nvim-treesitter.parsers').get_parser_configs().brainfuck = {
      install_info = { files = { '~/dotfiles/treesitter_parsers/brainfuck/parser.so' } },
      filetype = 'brainfuck',
    }
  end,
}

