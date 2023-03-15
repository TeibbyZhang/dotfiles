local vim = vim
local set_options = require('common').set_options

set_options({
  number = true,
  autoread = true,
  showmatch = true,
  showcmd = true,
  showtabline = 2,
  magic = true,
  cmdheight = 2,
  completeopt = 'menuone,noselect',
  hidden = true,
  hlsearch = true,
  encoding = 'utf-8',
  termencoding = 'utf-8',
  fileencoding = 'utf-8',
  fileencodings = 'utf-8',
  helplang = 'cn',
  langmenu = 'en_US.UTF-8',
  -- -- allow buffer line clickable
  -- mouse = 'a',

  -- tab setting
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  backspace = 2,
  cursorline = true,

  ruler = true,
  title = true,
  ignorecase = true,
  smartcase = true,
  -- autoindent = true,
  -- smartindent = true,
  swapfile = false,
  timeoutlen = 200,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  signcolumn = 'yes',
  spell = false,
  spelllang = 'en',
  scrolloff = 8,

  -- window split
  splitright = true,
  splitbelow = true,

  -- show terminal color
  termguicolors = true,
  background = 'dark',
})

vim.cmd('set shortmess+=c')
vim.cmd([[au FocusGained * :checktime]])

if vim.fn.has('gui_running') == 1 then
  vim.cmd('set t_Co=256')
end

vim.cmd('filetype on')
vim.cmd('filetype indent on')
vim.cmd('filetype plugin on')
vim.cmd('filetype plugin indent on')

