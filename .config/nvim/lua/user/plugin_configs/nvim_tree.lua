-- local set_keymap = require('common').set_keymap

local config = {
  allow_resize = 1,
  -- show_icons = {
  --   git = 1,
  -- },
}

local setup_opts = {
  disable_netrw = true,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  update_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  view = {
    width = 30,
    mappings = {
      custom_only = false,
    },
  },
  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = true,
    },
  },
  renderer = {
    root_folder_modifier = ':t',
    highlight_opened_files = 'icon',
    highlight_git = true,
    group_empty = true,
    indent_markers = {
      enable = true,
      inline_arrows = true,
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = '',
          staged = 'S',
          unmerged = '',
          renamed = '➜',
          deleted = '',
          untracked = 'U',
          ignored = '◌',
        },
        folder = {
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
        },
      },
    },
    special_files = { 'README.md', 'Makefile', 'MAKEFILE', 'readme.md', 'Cargo.toml' },
  },
  filters = {
    dotfiles = true,
    custom = { '^\\.git$', 'node_modules', '^\\.cache' },
  },
}

for key, val in pairs(config) do
  vim.g['nvim_tree_' .. key] = val
end

-- open nvim tree when setup
local function open_nvim_tree(data)

  -- buffer is a [No Name]
  local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require('nvim-tree.api').tree.open()
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

-- -- key mapping for nvim tree
-- set_keymap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
-- set_keymap('n', '<Leader>r', '<cmd>NvimTreeRefresh<CR>', { noremap = true, silent = true })
-- set_keymap('n', '<Leader>n', '<cmd>NvimTreeFindFile<CR>', { noremap = true, silent = true })

require('nvim-tree').setup(setup_opts)

