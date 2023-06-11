vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- base setting
require('options')
require('autocmds')
require('base_key_mapping')
require('sign_define')

require('plugins');
