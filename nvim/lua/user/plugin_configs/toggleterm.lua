local set_keymap = require('common').set_keymap

set_keymap('n', '<Leader>tf', '<cmd>ToggleTerm direction=float<Cr>', { noremap = true, silent = true })
set_keymap('n', '<Leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<Cr>', { noremap = true, silent = true })
set_keymap('n', '<Leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<Cr>', { noremap = true, silent = true })
set_keymap('t', '<C-h>', '<C-\\><C-n><cmd>ToggleTermToggleAll<Cr>', { noremap = true, silent = true })
set_keymap('n', '<C-h>', '<cmd>ToggleTerm<Cr>', { noremap = true, silent = true })

require('toggleterm').setup()
