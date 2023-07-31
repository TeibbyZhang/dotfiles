local M = {}

local set_common_keymap = require('common').set_common_keymap
local set_keymap = require('common').set_keymap

-- enhanced cursor move
set_common_keymap('n', '<C-j>', '15j')
set_common_keymap('n', '<C-k>', '15k')
set_common_keymap('v', '<C-j>', '15j')
set_common_keymap('v', '<C-k>', '15k')
set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, noremap = true, })
set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, noremap = true, })
-- set_common_keymap('n', 'gj', 'j')
-- set_common_keymap('n', 'gk', 'k')

-- enhanced nomal action
set_common_keymap('n', 'n', 'nzz')
set_common_keymap('n', 'N', 'Nzz')
set_common_keymap('n', '<C-s>', '<cmd>w<CR>')
set_common_keymap('i', 'jj', '<Esc>')
set_common_keymap('n', '<Leader><Leader>c', ':%s///gn<CR>')

set_common_keymap('n', '&', ':&&<CR>')
set_common_keymap('x', '&', ':&&<CR>')

set_keymap({ 'n', 'v' }, '<Leader>y', '"+y', { desc = 'Clipboard yank' })
set_keymap({ 'n', 'v' }, '<Leader>p', '"+p', { desc = 'Clipboard paste' })

set_keymap('n', '<Leader>ui', vim.show_pos, { desc = 'Inspect Pos' })

-- move enhanced
set_common_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
set_common_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
set_common_keymap('n', '<A-j>', ':m .+1<CR>==')
set_common_keymap('n', '<A-k>', ':m .-2<CR>==')
set_common_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv')
set_common_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv')
set_common_keymap('v', '<', '<gv')
set_common_keymap('v', '>', '>gv')

set_keymap('n', '<C-l>', ':<C-u>nohlsearch<CR><C-l>', { noremap = true, silent = true })
set_keymap('c', '%%', "getcmdtype()==':'?expand('%:h').'/':'%%'", { expr = true })

M.wk_leader_key_map = {
  ['<Leader>'] = {
    name = 'More Actions',
    c = {
      name = 'Pattern Count',
    },
  },

  c = {
    name = 'Code Actions',
    a = {
      name = 'Code Action',
    },
  },
}

-- quit quickfix buffer when press <CR>
vim.cmd [[autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>]]

return M
