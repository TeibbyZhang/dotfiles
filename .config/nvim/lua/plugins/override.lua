return {
  {
    'folke/trouble.nvim',
    ft = { 'qf' },
    opts = {
      position = 'bottom',
      height = 10,
      mode = 'workspace_diagnostics',
      group = true,
      padding = true,
      indent_lines = true,
      auto_open = false,
      auto_close = false,
      auto_preview = true,
      auto_fold = false,
      auto_jump = { 'lsp_definitions' },
      use_diagnostic_signs = true,
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = function(_, opts)
      -- Other blankline configuration here
      return require('indent-rainbowline').make_opts(opts, {
        color_transparency = 0.18,
      })
    end,
    dependencies = {
      'TheGLander/indent-rainbowline.nvim',
    },
  },
}
