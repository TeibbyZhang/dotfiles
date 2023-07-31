local set_keymap = require('common').set_keymap

-- set search key map
set_keymap('n', '<Leader>S', '<cmd>lua require(\'spectre\').open()<CR>')
set_keymap('n', '<Leader>sw', '<cmd>lua require(\'spectre\').open_visual({select_word=true})<CR>')
set_keymap('v', '<Leader>s', '<cmd>lua require(\'spectre\').open_visual()<CR>')
set_keymap('n', '<Leader>sp', '<cmd>lua require(\'spectre\').open_file_search()<CR>')

require('spectre').setup({
  live_update = true,
  open_cmd = ':leftabove vnew',
  is_insert_mode = true,
})

