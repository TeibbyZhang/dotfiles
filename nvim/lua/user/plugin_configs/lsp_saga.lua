local lspsaga = require('lspsaga')
lspsaga.setup({
  border_style = 'rounded',
  symbol_in_winbar = {
    enable = false,
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
