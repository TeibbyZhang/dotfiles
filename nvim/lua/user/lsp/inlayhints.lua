vim.api.nvim_create_augroup('LspAttach_inlayhints', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = 'LspAttach_inlayhints',
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.name == 'tsserver' then
      require('lsp-inlayhints.adapter').set_old_tsserver()
      vim.notify('set set_old_tsserver')
    end
    require('lsp-inlayhints').on_attach(client, bufnr)
  end,
})

require('lsp-inlayhints').setup()
