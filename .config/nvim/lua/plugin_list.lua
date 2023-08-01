local M = {}

local plugin_list = {
  -- theme
  -- {
  --   'shaunsingh/nord.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('user.colorscheme')
  --   end,
  -- },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('user.colorscheme')
    end,
  },

  -- inputt method for linux
  {
    'h-hg/fcitx.nvim',
    cond = vim.fn.has('linux') == 1,
  },

  -- base plugin
  {
    'kdheepak/lazygit.nvim',
    event = 'VeryLazy',
    config = function()
      require('user.plugin_configs.lazygit')
    end,
  },

  -- 'nvim-lua/popup.nvim', -- implementation of the Popup API from vim in Neovim
  {
    'rcarriga/nvim-notify', -- notify
    lazy = false,
    config = function()
      local notify = require('notify');
      notify.setup({
        background_colour = '#000000',
      })
      vim.notify = notify
    end,
  },

  -- copilot for neovim
  -- {
  --   'zbirenbaum/copilot.lua',
  --   event = 'VimEnter',
  --   config = function()
  --     vim.defer_fn(function()
  --       require('copilot').setup()
  --     end, 100)
  --   end,
  -- },

  -- debug 貌似不太好用，先注释掉
  -- -- for debugger
  -- 'mfussenegger/nvim-dap', -- plugin for debug
  -- 'theHamsta/nvim-dap-virtual-text',
  -- 'rcarriga/nvim-dap-ui',

  -- 'nvim-telescope/telescope-ui-select.nvim', -- I don't need it temporarily

  {
    'nvim-telescope/telescope.nvim', -- very nice plugin!
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      'nvim-telescope/telescope-live-grep-raw.nvim',
      'kdheepak/lazygit.nvim',
    },
    config = function()
      require('user.plugin_configs.telescope')
    end,
  },

  -- bookmark
  'MattesGroeger/vim-bookmarks',
  {
    'tom-anders/telescope-vim-bookmarks.nvim', -- use telescope prompt to show bookmarks
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  },

  -- dap use telescope ui
  {
    'nvim-telescope/telescope-dap.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim', -- very nice plugin!
      'mfussenegger/nvim-dap',
    },
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
      {
        'romgrk/nvim-treesitter-context',
        config = function()
          require('user.plugin_configs.treesitter_context')
        end,
      },

    },
    config = function()
      require('user.plugin_configs.treesitter')
    end,
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    event = 'BufRead',
    config = function()
      require('user.plugin_configs.rainbow_delimiters')
    end,
  },

  -- comment
  {
    'terrortylor/nvim-comment',
    event = 'BufRead',
    config = function()
      require('nvim_comment').setup({
        hook = function()
          require('ts_context_commentstring.internal').update_commentstring()
        end,
      })
    end,
  },

  {
    'andymass/vim-matchup',
    event = 'CursorMoved',
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end,
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
    'folke/lsp-colors.nvim',
    event = 'LspAttach',
    config = true,
  },
  {
    'simrat39/rust-tools.nvim',
    -- use this will not auto attach server when enter rust buffer
    -- ft = { 'rust', 'toml' },
    event = { "BufReadPost *.rs,*.toml" },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require('rust-tools').setup({
        server = {
          on_attach = require('user.lsp.handler').on_attach
        },
        tools = {
          inlay_hints = {
            auto = false,
          },
        },
      })
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
      -- need if config rust
      'simrat39/rust-tools.nvim',
    },
    config = function()
      require('user.plugin_configs.lsp_saga')
    end
  },

  {
    'williamboman/mason.nvim',
    event = 'UIEnter',
    config = true,
  },
  
  -- mason extensions
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
    },
    config = function()
      require('user.plugin_configs.mason_tool_installer')
    end,
  },
  {
    'jayp0521/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
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
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
    },
    config = true,
  },
  {
    'jayp0521/mason-nvim-dap.nvim',
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    config = true,
  },

  {
    'lvimuser/lsp-inlayhints.nvim',
    event = 'BufReadPre',
    branch = 'anticonceal',
    config = function()
      require('user.lsp.inlayhints')
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    dependencies = {
      'b0o/schemastore.nvim',
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
    },
    config = function()
      require('user.lsp')
    end,
  },

  {
    'ray-x/lsp_signature.nvim',
    event = 'InsertEnter',
    config = function()
      require('lsp_signature').setup()
    end,
  },

  -- auto completion and snippet
  {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    event = 'UIEnter',
    dependencies = {
      'neovim/nvim-lspconfig',
      -- Snippet Plugins
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',

      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-emoji',
      -- copilot cmp
      {
        'zbirenbaum/copilot-cmp',
        config = function()
          require('copilot_cmp').setup()
        end
      },
    },
    config = function()
      require('user.plugin_configs.nvim_cmp').setup()
    end,
  },

  {
    'ethanholz/nvim-lastplace',
    lazy = false,
    config = true,
  },

  -- 'tpope/vim-repeat',
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = true,
  },

  {
    'akinsho/toggleterm.nvim', -- toggle terminal
    event = 'BufRead',
    keys = {
      { '<Leader>tf', '<cmd>ToggleTerm direction=float<CR>', noremap = true, silent = true, desc = 'show float terminal' },
      { '<Leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<CR>', noremap = true, silent = true, desc = 'show horizontal terminal' },
      { '<Leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<CR>', noremap = true, silent = true, desc = 'show vertical terminal' },
      { '<C-h>', '<C-\\><C-n><cmd>ToggleTermToggleAll<CR>', noremap = true, silent = true, mode = 't', desc = 'toggle terminal' },
      { '<C-h>', '<cmd>ToggleTerm<CR>', noremap = true, silent = true, desc = 'toggle terminal' },
    },
    config = true,
  },
  -- indent blankline
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function()
      require('indent_blankline').setup({
        show_current_context = true,
      })
    end,
  },

  -- like eaymotion and more powerful
  {
    'phaazon/hop.nvim',
    event = 'BufRead',
    config = function()
      require('user.plugin_configs.hop')
    end,
  },

  -- {
  --   'nathom/filetype.nvim',
  --   lazy = false,
  --   config = function()
  --     require('user.plugin_configs.filetype')
  --   end,
  -- },

  -- autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('user.plugin_configs.autopairs')
    end,
  },

  -- git
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('user.plugin_configs.gitsigns')
    end,
  },
  {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
  },

  {
    'folke/trouble.nvim',
    ft = { 'qf' },
    config = function()
      require('user.plugin_configs.trouble')
    end,
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('user.plugin_configs/which_key')
    end,
  },

  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({
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
      require('project_nvim').setup({})
    end,
  },

  -- tree plugin
  {
    'kyazdani42/nvim-tree.lua',
    lazy = false,
    keys = {
      { '<C-n>', '<cmd>NvimTreeToggle<CR>', noremap = true, silent = true, desc = 'ToggleNvimTree' },
      { '<Leader>r', '<cmd>NvimTreeRefresh<CR>', noremap = true, silent = true, desc = 'RefreshNvimTree' },
      { '<Leader>n', '<cmd>NvimTreeFindFile<CR>', noremap = true, silent = true, desc = 'FindFileInNvimTree' },
    },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('user.plugin_configs.nvim_tree')
    end,
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v2.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --     {
  --       -- only needed if you want to use the commands with "_with_window_picker" suffix
  --       's1n7ax/nvim-window-picker',
  --       tag = "v1.*",
  --       config = function()
  --         require('user.plugin_configs.window_picker')
  --       end,
  --     }
  --   },
  --   config = function ()
  --     require('user.plugin_configs.neo_tree')
  --   end
  -- },

  -- {
  --   'SmiteshP/nvim-gps',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --   config = function()
  --     require('nvim-gps').setup()
  --   end,
  -- },

  -- version 2.0 of nvim-gps, based on lsp
  {
    'SmiteshP/nvim-navic',
    event = 'LspAttach',
    dependencies = 'neovim/nvim-lspconfig',
    config = function()
      require('user.plugin_configs.nvim_navic')
    end,
  },

  {
    'j-hui/fidget.nvim',
    event = 'BufRead',
    tag = 'legacy',
    config = function()
      require('fidget').setup({
        window = {
          blend = 0,
        },
      });
    end,
  },

  -- status bar
  -- heirline.nvim also config winbar
  -- {
  --   'rebelot/heirline.nvim',
  --   -- You can optionally lazy-load heirline on UiEnter
  --   -- to make sure all required plugins and colorschemes are loaded before setup
  --   event = "UiEnter",
  --   config = function()
  --     require('user.plugin_configs.heirline')
  --   end
  -- },
  {
    'nvim-lualine/lualine.nvim',
    event = 'BufRead',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      opt = true,
    },
    config = function()
      require('user.plugin_configs.lualine')
    end,
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

  -- buf perf
  {
    'akinsho/bufferline.nvim',
    event = 'BufRead',
    config = function()
      require('user.plugin_configs.bufferline')
    end,
  },
  {
    'johann2357/nvim-smartbufs',
    event = 'BufRead',
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
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },
  -- show outline
  {
    'stevearc/aerial.nvim',
    event = 'BufRead',
    config = true,
  },

  -- show color of hex color
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
      require('colorizer').setup()
    end
  },

  -- {
  --   'ldelossa/litee-calltree.nvim',
  --   event = 'BufRead',
  --   dependencies = {
  --     'ldelossa/litee.nvim',
  --   },
  --   config = function()
  --     require('user.plugin_configs.litee_calltree')
  --   end
  -- },

  -- {
  --   'ellisonleao/glow.nvim', -- preview markdown
  --   config = true,
  --   cmd = 'Glow',
  -- },
  {
    'mtdl9/vim-log-highlighting',
    event = 'VeryLazy',
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
  --   dependencies = {
  --     'MunifTanjim/nui.nvim',
  --     'rcarriga/nvim-notify',
  --     'hrsh7th/nvim-cmp',
  --   },
  -- },
}

M.plugin_list = plugin_list

return M
