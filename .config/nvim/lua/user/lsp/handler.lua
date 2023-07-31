local M = {}

local function set_buf_config(bufnr, client)
  local set_keymap = require('common').set_keymap
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- enable completion triggered by <C-x><C-a>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- key mappings
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  set_keymap('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', opts)
  set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  set_keymap('n', '<Leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  set_keymap('n', '<Leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  -- set_keymap('n', '<Leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  set_keymap('n', 'gp', '<cmd>Lspsaga peek_definition<CR>', opts);
  -- set_keymap('n', 'gr', '<cmd>lua require("lspsaga.finder").lsp_finder()<CR>', opts)
  -- set_keymap('n', 'gi', '<cmd>lua require("lspsaga.implement").lspsaga_implementation()<CR>', opts)
  set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  -- set_keymap('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
  -- set_keymap('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
  -- set_keymap('n', 'gs', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
  set_keymap('n', '<Leader>rn', '<cmd>Lspsaga rename<CR>', opts)
  set_keymap('n', '<Leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
  set_keymap('v', '<Leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
  set_keymap('n', '<Leader>cd', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
  set_keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  set_keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  set_keymap('n', '<Leader>cf', function() vim.lsp.buf.format({ async = true }) end, opts)
  set_keymap('n', '[E', function() require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, opts)
  set_keymap('n', ']E', function() require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR }) end, opts)
  set_keymap('n', '<Leader>co', ':LSoutlineToggle<CR>', opts)

  local ok, navic = pcall(require, 'nvim-navic')
  if ok then
    navic.attach(client, bufnr)
  end
end

local function set_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
      false
    )
  end
end

M.on_attach = function(client, bufnr)
  set_buf_config(bufnr, client)
  set_highlight_document(client)
end

return M

