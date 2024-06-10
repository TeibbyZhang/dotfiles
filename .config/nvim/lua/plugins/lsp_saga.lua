return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        sign = false,
      },
    })
  end,
  event = 'LspAttach',
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  }
}
