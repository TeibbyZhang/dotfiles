local M = {}

local plugin_list = {
  {
    'lewis6991/impatient.nvim', -- speed up loading Lua modules
    config = function()
      require('impatient').enable_profile()
      -- require('impatient')
    end,
  },
  'wbthomason/packer.nvim', -- use packer to manage itself

  -- base plugin
  {
    'kdheepak/lazygit.nvim',
    config = function()
      require('user.plugin_configs.lazygit')
    end,
  },
  'nvim-lua/popup.nvim', -- implementation of the Popup API from vim in Neovim
  'nvim-lua/plenary.nvim',
  {
    'rcarriga/nvim-notify', -- notify
    config = function()
      vim.notify = require('notify')
    end,
  },

  -- copilot for neovim
  {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },

  -- debug 貌似不太好用，先注释掉
  -- -- for debugger
  -- 'mfussenegger/nvim-dap', -- plugin for debug
  -- 'theHamsta/nvim-dap-virtual-text',
  -- 'rcarriga/nvim-dap-ui',


  -- theme
  'shaunsingh/nord.nvim',

  -- 'nvim-telescope/telescope-ui-select.nvim', -- I don't need it temporarily

  {
    'nvim-telescope/telescope.nvim', -- very nice plugin!
    requires = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
      'nvim-telescope/telescope-live-grep-raw.nvim',
      'kdheepak/lazygit.nvim',
    },
    after = {
      'project.nvim',
    },
    config = function()
      require('user.plugin_configs.telescope')
    end,
  },

  -- bookmark
  'MattesGroeger/vim-bookmarks',
  {
    'tom-anders/telescope-vim-bookmarks.nvim', -- use telescope prompt to show bookmarks
    requires = {
      'nvim-telescope/telescope.nvim',
    },
  },

  -- dap use telescope ui
  {
    'nvim-telescope/telescope-dap.nvim',
    requires = {
      'nvim-telescope/telescope.nvim', -- very nice plugin!
      'mfussenegger/nvim-dap',
    },
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('user.plugin_configs.treesitter')
    end,
  },

  {
    'p00f/nvim-ts-rainbow',
    after = 'nvim-treesitter',
  },
  {
    'windwp/nvim-ts-autotag',
    after = 'nvim-treesitter',
  },
  {
    'andymass/vim-matchup',
    event = 'CursorMoved',
    after = 'nvim-treesitter',
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },
  {
    'romgrk/nvim-treesitter-context',
    after = 'nvim-treesitter',
    config = function()
      require('user.plugin_configs.treesitter_context')
    end,
  },
  {
    'm-demare/hlargs.nvim', -- highlight function args
    requires = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('hlargs').setup()
      vim.cmd [[autocmd ColorScheme * highlight! link Hlargs TSParameter]]
    end,
  },

  -- lsp auto install and autocomplete support for nvim
  'neovim/nvim-lspconfig',
  {
    'folke/lsp-colors.nvim',
    config = function()
      require('lsp-colors').setup()
    end,
  },
  {
    'simrat39/rust-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require('rust-tools').setup({
        inlay_hints = {
          auto = false,
        },
      })
    end,
  },
  {
    'glepnir/lspsaga.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      -- need if config rust
      'simrat39/rust-tools.nvim',
    },
    config = function()
      require('user.plugin_configs.lsp_saga')
    end
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({})
    end,
  },
  
  -- mason extensions
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    requires = {
      'williamboman/mason.nvim',
    },
    config = function()
      require('user.plugin_configs.mason_tool_installer')
    end,
  },
  {
    'jayp0521/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    requires = {
      'nvim-lua/plenary.nvim',
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = function()
      require('user.plugin_configs.null_ls')
    end,
  },
  {
    'RubixDev/mason-update-all',
    requires = {
      'williamboman/mason.nvim',
    },
    config = function()
      require('mason-update-all').setup()
    end,
  },
  {
    'jayp0521/mason-nvim-dap.nvim',
    requires = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require('mason-nvim-dap').setup()
    end,
  },

  {
    'lvimuser/lsp-inlayhints.nvim',
    -- branch = 'anticonceal',
    config = function()
      require('user.lsp.inlayhints')
    end,
  },
  'b0o/schemastore.nvim',
  {
    'williamboman/mason-lspconfig.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
    },
    after = {
      'schemastore.nvim',
    },
    config = function()
      require('user.lsp')
    end,
  },
  {
    'ray-x/lsp_signature.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('lsp_signature').setup()
    end,
  },

  -- Snippet Plugins
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  -- auto completion and snippet
  {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    requires = {
      'neovim/nvim-lspconfig',
    },
    after = {
      'nvim-autopairs',
      'LuaSnip',
    },
    config = function()
      require('user.plugin_configs.nvim_cmp').setup()
    end,
  },
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'hrsh7th/cmp-calc',
  'hrsh7th/cmp-emoji',
  
  -- copilot cmp
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  },

  -- comment
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end,
  },
  {
    'ethanholz/nvim-lastplace',
    config = function()
      require('nvim-lastplace').setup()
    end,
  },

  'tpope/vim-repeat',
  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
  },

  {
    'akinsho/toggleterm.nvim', -- toggle terminal
    config = function()
      require('user.plugin_configs.toggleterm')
    end,
  },
  -- indent blankline
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        show_current_context = true,
      })
    end,
  },

  -- like eaymotion and more powerful
  {
    'phaazon/hop.nvim',
    config = function()
      require('user.plugin_configs.hop')
    end,
  },

  {
    'nathom/filetype.nvim',
    config = function()
      require('user.plugin_configs.filetype')
    end,
  },

  -- autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('user.plugin_configs.autopairs')
    end,
  },

  -- git
  {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('user.plugin_configs.gitsigns')
    end,
  },
  {
    'sindrets/diffview.nvim',
    after = {
      'project.nvim',
    },
  },
  {
    'folke/trouble.nvim',
    config = function()
      require('user.plugin_configs.trouble')
    end,
  },

  {
    'folke/which-key.nvim',
    config = function()
      require('user.plugin_configs/which_key')
    end,
  },

  {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require'nvim-web-devicons'.setup({
        override = {
          zsh = {
            icon = ' ',
            color = '#428850',
            cterm_color = '65',
            name = 'Zsh',
          },
        },
        default = true,
      })
    end,
  },

  {
    'ahmedkhalf/project.nvim',
    config = function()
      require("project_nvim").setup({})
    end,
  },

  -- tree plugin
  {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    after = {
      'project.nvim',
    },
    config = function()
      require('user.plugin_configs.nvim_tree')
    end,
  },

  {
    'SmiteshP/nvim-gps',
    requires = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('nvim-gps').setup()
    end,
  },

  -- winbar
  {
    'fgheng/winbar.nvim',
    requires = {
      'SmiteshP/nvim-gps',
    },
    after = {
      'nvim-gps',
    },
    config = function()
      require('winbar').setup({
        enabled = true,
        show_file_path = true,
        show_symbols = true,
      })
    end,
  },

  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup();
    end,
  },

  -- 'arkav/lualine-lsp-progress',
  -- status bar
  {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
    },
    after = {
      'nvim-gps',
      -- 'lualine-lsp-progress',
    },
    config = function()
      require('user.plugin_configs.lualine')
    end,
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('user.plugin_configs.bufferline')
    end,
  },
  {
    'johann2357/nvim-smartbufs',
    config = function()
      require('user.plugin_configs.smartbufs')
    end,
  },

  -- search and replace
  {
    'windwp/nvim-spectre',
    event = 'BufRead',
    config = function()
      require('user.plugin_configs.spectre')
    end,
  },

  -- others
  {
    'folke/todo-comments.nvim', -- enhance todo comments
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup()
    end,
  },
  -- show outline
  {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup()
    end,
  },
  -- show color of hex color
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },

  'ldelossa/litee.nvim',
  {
    'ldelossa/litee-calltree.nvim',
    requires = {
      'ldelossa/litee.nvim',
    },
    config = function()
      require('user.plugin_configs.litee_calltree')
    end
  },
  'ellisonleao/glow.nvim', -- preview markdown
  'mtdl9/vim-log-highlighting',
  {
    'Pocco81/HighStr.nvim',
    config = function()
      require('user.plugin_configs.high_str')
    end
  },

  -- editorconfig read
  {
    'gpanders/editorconfig.nvim',
  },

  -- quickfix enhanced
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
      require('user.plugin_configs.bqf')
    end,
  },
  
  -- -- ui perf
  -- {
  --   'folke/noice.nvim',
  --   event = 'VimEnter',
  --   config = function()
  --     require('user.plugin_configs.noice')
  --   end,
  --   requires = {
  --     'MunifTanjim/nui.nvim',
  --     'rcarriga/nvim-notify',
  --     'hrsh7th/nvim-cmp',
  --   },
  -- },
}

M.plugin_list = plugin_list

return M
