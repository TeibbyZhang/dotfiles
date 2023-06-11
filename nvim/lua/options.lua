local set_options = require('common').set_options

set_options({
  number = true,
  autoread = true,
  showmatch = true,
  showcmd = true,
  showtabline = 2,
  conceallevel = 3, -- Hide * markup for bold and italic
  confirm = true, -- Confirm to save changes before exiting modified buffer
  list = true, -- Show some invisible characters (tabs...
  pumheight = 10, -- Maximum number of entries in a popup
  sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
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
  backspace = 'indent,eol,start',
  cursorline = true,

  ruler = true,
  title = true,
  ignorecase = true,
  smartcase = true,
  -- autoindent = true,
  -- smartindent = true,
  shiftround = true, -- Round indent
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

  -- for nvim 0.9
  splitkeep = 'screen',
})

-- C = true is for nvim 0.9
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

if vim.fn.has('gui_running') == 1 then
  vim.cmd('set t_Co=256')
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.g.do_filetype_lua = true
vim.g.did_load_filetypes = false

-- vim.cmd('filetype on')
-- vim.cmd('filetype indent on')
-- vim.cmd('filetype plugin on')
-- vim.cmd('filetype plugin indent on')

