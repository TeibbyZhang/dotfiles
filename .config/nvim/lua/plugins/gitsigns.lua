return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 1000, follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 0,
        ignore_whitespace = false,
      },
      current_line_blame_formatter_opts = {
        relative_time = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
      -- -- keymapping
      -- on_attach = function(bufnr)
      --   local function map(mode, lhs, rhs, opts)
      --     opts = opts or {}
      --     opts.buffer = bufnr
      --     vim.keymap.set(mode, lhs, rhs, opts)
      --   end
      --
      --   -- Navigation
      --   map('n', '<leader>hn', ':Gitsigns next_hunk<CR>')
      --   map('n', '<leader>hp',':Gitsigns prev_hunk<CR>')
      --
      --   -- Actions
      --   map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
      --   map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
      --   map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
      --   map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
      --   map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
      --   map('n', '<leader>hv', '<cmd>Gitsigns preview_hunk<CR>')
      --   map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
      --   map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
      --   map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
      --   map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
      --   map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')
      --   --
      --   -- Text object
      --   map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      -- end,
    },
    config = function(_, opts)
      vim.cmd[[highlight link gitsignscurrentlineblame Comment]]
      require('gitsigns').setup(opts)
    end,
  },
}
