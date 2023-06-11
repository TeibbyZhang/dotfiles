local opts = {
  autoselect_one = true,
  include_current = false,
  filter_rules = {
    -- filter using buffer options
    bo = {
      -- if the file type is one of following, the window will be ignored
      filetype = { 'neo-tree', "neo-tree-popup", "notify" },

      -- if the buffer type is one of following, the window will be ignored
      buftype = { 'terminal', "quickfix" },
    },
  },
  selection_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  other_win_hl_color = '#88C0D0',
}

require('window-picker').setup(opts)
