local lspsaga = require('lspsaga')
lspsaga.setup({
  symbol_in_winbar = {
    enable = false,
  },
  ui = {
    border = 'rounded',
    expand = '⊞',
    collapse = '⊟',
    code_action = '󰌵',
    actionfix = ' ',
    kind = nil,
    imp_sign = '󰳛 ',
  },
})
vim.api.nvim_exec(
  [[
    augroup lspsaga_filetypes
      autocmd!
      autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<CR>
    augroup END
  ]],
  false
)
