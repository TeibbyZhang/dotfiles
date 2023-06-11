local opts = {
  options = {
    mode = 'buffers',
    numbers = 'buffer_id',
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    diagnostics = 'nvim_lsp',
    offsets = {
      { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' },
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    always_show_bufferline = true,
  },
}

require('bufferline').setup(opts)

