-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false

vim.g.mapleader = '\\'

-- migration from old config
vim.g.do_filetype_lua = true
vim.g.did_load_filetypes = false

local options = {
  clipboard = '',
  encoding = 'utf-8',
  relativenumber= false,
  scrolloff = 8,
  showmode = true,
  updatetime = 300,
  wrap = true,
  hlsearch = true,
  magic = true,
  cmdheight = 2,
  showtabline = 2,
  showcmd = true,
  showmatch = true,
  autoread = true,
  helplang = 'cn',
  langmenu = 'en_US.UTF-8',
  softtabstop = 2,
  backspace = 'indent,eol,start',
  ruler = true,
  title = true,
  swapfile = false,
  writebackup = false,
  spell = false,
  background = 'dark',
}

if vim.fn.has('linux') == 1 then
  vim.g.fcitx5_rime = 1
end

function set_options(opts)
  for key, val in pairs(opts) do
    vim.opt[key] = val
  end
end

set_options(options)
