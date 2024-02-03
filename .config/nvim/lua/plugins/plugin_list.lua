return {
  {
    'j-hui/fidget.nvim',
    event = 'BufRead',
    opts = {
      window = {
        blend = 0,
      },
    },
  },
  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      icons = {
        ui = {
          bar = {
            separator = ' > ',
          },
        },
      },
    },
  },

  -- input method for linux
  {
    'h-hg/fcitx.nvim',
    cond = vim.fn.has('linux') == 1,
  },

  -- quickfix enhanced
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
      require('bqf').setup()
    end,
  },
  {
    'ahmedkhalf/project.nvim',
    opts = {
      manual_mode = false,
    },
  },
  {
    'm-demare/hlargs.nvim', -- highlight function args
    event = 'BufRead',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('hlargs').setup()
      vim.cmd [[autocmd ColorScheme * highlight! link Hlargs TSParameter]]
    end,
  },
  {
    'akinsho/toggleterm.nvim', -- toggle terminal
    event = 'BufRead',
    keys = {
      { '<Leader>ft', '<cmd>ToggleTerm direction=float<CR>', noremap = true, silent = true, desc = 'show float terminal' },
      { '<Leader>fT', '<cmd>ToggleTerm size=10 direction=horizontal<CR>', noremap = true, silent = true, desc = 'show horizontal terminal' },
      { '<Leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<CR>', noremap = true, silent = true, desc = 'show vertical terminal' },
      { '<C-h>', '<C-\\><C-n><cmd>ToggleTermToggleAll<CR>', noremap = true, silent = true, mode = 't', desc = 'toggle terminal' },
      { '<C-h>', '<cmd>ToggleTerm<CR>', noremap = true, silent = true, desc = 'toggle terminal' },
      { '<C-/>', '<C-\\><C-n><cmd>ToggleTermToggleAll<CR>', noremap = true, silent = true, mode = 't', desc = 'toggle terminal' },
      { '<C-/>', '<cmd>ToggleTerm<CR>', noremap = true, silent = true, desc = 'toggle terminal' },
    },
    config = true,
  },
}
