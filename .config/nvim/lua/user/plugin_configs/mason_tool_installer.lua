local opts = {
  ensure_installed = {
    'bash-language-server',
    'lua-language-server',
    'vim-language-server',
    'editorconfig-checker',
    'luacheck',
  },
}

require('mason-tool-installer').setup(opts)
