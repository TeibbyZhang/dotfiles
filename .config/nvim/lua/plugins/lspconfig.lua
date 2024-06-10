return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              }
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
      },
      setup = {
        rust_analyzer = function ()
          return true
        end
      },
    },
    init = function()
      local keys = require('lazyvim.plugins.lsp.keymaps').get()
      keys[#keys + 1] = { 'K', '<cmd>Lspsaga hover_doc<CR>' }
      keys[#keys + 1] = { '<Leader>ca', '<cmd>Lspsaga code_action<CR>' }
      keys[#keys + 1] = { '<Leader>cD', '<cmd>Lspsaga show_cursor_diagnostics<CR>' }
      keys[#keys + 1] = { 'gd', '<cmd>Lspsaga goto_definition<CR>' }
      keys[#keys + 1] = { 'gF', '<cmd>Lspsaga finder<CR>' }
    end,
  },
}
