local set_keymap = require('common').set_keymap

local keymap_opts = { noremap = true, silent = true }
set_keymap('n', '[b', '<cmd>lua require(\'nvim-smartbufs\').goto_prev_buffer()<CR>', keymap_opts)
set_keymap('n', ']b', '<cmd>lua require(\'nvim-smartbufs\').goto_next_buffer()<CR>', keymap_opts)
set_keymap('n', '<Leader>bc', '<cmd>lua require(\'nvim-smartbufs\').close_current_buffer()<CR>', keymap_opts)
set_keymap('n', '<Leader>bo', '<cmd>lua require(\'nvim-smartbufs\').close_all()<CR>', keymap_opts)

