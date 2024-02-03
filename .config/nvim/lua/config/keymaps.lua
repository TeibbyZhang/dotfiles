-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set;

map({ 'n', 'v' }, '<C-j>', '15j')
map({ 'n', 'v' }, '<C-k>', '15k')

-- map('n', 'n', 'nzz')
-- map('n', 'N', 'Nzz')
map('i', 'jj', '<Esc>')
map('n', '<Leader><Leader>c', ':%s///gn<CR>')

map({ 'n', 'x' }, '&', ':&&<CR>')

map({ 'n', 'v' }, '<Leader>y', '"+y', { desc = 'Clipboard yank' })
map({ 'n', 'v' }, '<Leader>p', '"+p', { desc = 'Clipboard paste' })

map('n', '<C-l>', ':<C-u>nohlsearch<CR><C-l>', { noremap = true, silent = true })
map('t', '<C-l>', '<C-l>', { noremap = true })
map('c', '%%', "getcmdtype()==':'?expand('%:h').'/':'%%'", { expr = true })
