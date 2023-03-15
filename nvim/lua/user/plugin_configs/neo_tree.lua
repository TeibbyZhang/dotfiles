local set_keymap = require('common').set_keymap

vim.notify('register keymap')
set_keymap('n', '<C-n>', ':Neotree<CR>', { noremap = true, silent = true })
