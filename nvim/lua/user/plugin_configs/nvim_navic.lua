vim.api.nvim_create_augroup('LspAttach_navic', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = 'LspAttach_navic',
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client.server_capabilities.documentSymbolProvider then
      return
    end

    require('nvim-navic').attach(client, bufnr)
  end,
})

require('nvim-navic').setup()
