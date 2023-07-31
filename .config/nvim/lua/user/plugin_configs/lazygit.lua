local set_keymap = require('common').set_keymap

set_keymap('n', '<Leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
