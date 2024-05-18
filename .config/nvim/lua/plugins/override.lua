return {
  {
    'folke/trouble.nvim',
    ft = { 'qf' },
    opts = {
      position = 'bottom',
      icons = true,
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
}
