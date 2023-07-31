local M = {};

local gen_capabilities_with_snippet_support = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

M.gen_capabilities_with_snippet_support = gen_capabilities_with_snippet_support

return M

