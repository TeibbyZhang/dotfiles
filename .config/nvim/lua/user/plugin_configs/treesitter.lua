local langs = {
  'bash',
  'graphql',
  'html',
  'json',
  'json5',
  'jsonc',
  'lua',
  'rust',
  'toml',
  'yaml',
  'css',
  'javascript',
  'typescript',
  'tsx',
  'jsdoc',
  'markdown',
  -- use for lsp_saga hover action
  'markdown_inline',
}

-- let tsconfig*.json can parse comment in json file
vim.cmd [[autocmd BufNewFile,BufRead tsconfig*.json setlocal filetype=jsonc]]

local treesitter_config = require('nvim-treesitter.configs')

local config = {
  ensure_installed = langs,
  sync_install = false,
  ignore_install = { 'javascript' },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
      swap = {
        enable = false,
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']]'] = '@function.outer',
        },
        goto_next_end = {
          [']['] = '@function.outer',
        },
        goto_previous_start = {
          ['[['] = '@function.outer',
        },
        goto_previous_end = {
          ['[]'] = '@function.outer',
        },
      },
      lsp_interop = {
        enable = false,
        border = 'none',
      },
    },
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = { 'yaml' },
  },
  auto_tag = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

treesitter_config.setup(config)

