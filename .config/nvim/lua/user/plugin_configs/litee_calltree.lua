local litee_lib = require('litee.lib')
local litee_calltree = require('litee.calltree')

litee_lib.setup({
  panel = {
    orientation = 'right',
    panel_size = 50,
  },
})

litee_calltree.setup({
  on_open = 'popout',
  hide_cursor = false,
  keymaps = {
    expand = 'o',
    collpase = 'zc',
    collpase_all = 'zM',
    jump = '<CR>',
    jump_split = 's',
    jump_vsplit = 'v',
    jump_tab = 't',
    hover = 'i',
    details = 'd',
    close = 'X',
    close_panel_pop_out = '<C-c>',
    help = '?',
    hide = 'H',
    switch = 'S',
    focus = 'f',
  },
})
