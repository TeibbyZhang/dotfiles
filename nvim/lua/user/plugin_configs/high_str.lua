local set_keymap = require('common').set_keymap
local high_str = require('high-str')

high_str.setup()

set_keymap('v', '<f3>', ':<C-u>HSHighlight 1<CR>', { noremap = true, silent = true })
set_keymap('v', '<f4>', ':<C-u>HSRmHighlight<CR>', { noremap = true, silent = true })

