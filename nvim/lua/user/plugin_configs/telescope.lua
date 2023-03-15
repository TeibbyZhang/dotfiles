local set_keymap = require('common').set_keymap

-- set telescope key map
set_keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>')
set_keymap('n', '<Leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>')
set_keymap('n', '<Leader>fg', '<cmd>lua require("telescope.builtin").live_grep({ debounce = 100 })<CR>')
set_keymap('n', '<Leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>')
set_keymap('n', '<Leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>')
set_keymap('n', '<Leader>fo', '<cmd>lua require("telescope.builtin").oldfiles()<CR>')
set_keymap('n', '<Leader>fs', '<cmd>lua require("telescope.builtin").grep_string({ debounce = 100 })<CR>')
set_keymap('v', '<Leader>fs', '"zy:lua require("telescope.builtin").grep_string({ debounce = 100, default_text = "<C-r>z" })<CR>')

local telescope = require('telescope')

local setup_opts = {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.75,
      preview_cutoff = 120,
      horizontal = { mirror = false },
      vertical = { mirror = false },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    file_ignore_patterns = {},
    path_display = { absolute = true },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    pickers = {
      find_files = {
        find_command = { 'fd', '--type=file', '--hidden', '--smart-case' },
      },
      live_grep = {
        --@usage don't include the filename in the search results
        only_sort_text = true,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
}

telescope.setup(setup_opts)

telescope.load_extension('fzf')
-- for project.nvim plugin
telescope.load_extension('projects')
telescope.load_extension('dap')
telescope.load_extension('vim_bookmarks')
telescope.load_extension('lazygit')

