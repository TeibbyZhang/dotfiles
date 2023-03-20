local _ = require('mason-core.functional')
local gen_capabilities_with_snippet_support = require('user.lsp.utils').gen_capabilities_with_snippet_support
local on_attach = require('user.lsp.handler').on_attach

-- local default_install_languages = {
--   'bash',
--   'css',
--   -- maybe do not need
--   'eslint',
--   'emmet',
--   'graphql',
--   'html',
--   'json',
--   'javascript',
--   'lua',
--   'rust',
--   'taiwindcss',
--   'typescript',
--   'viml',
--   'yaml',
-- }

local server_name_language_map = {
  bash = 'bashls',
  css = 'cssls',
  -- eslint = 'eslint',
  emmet = 'emmet_ls',
  -- graphql = 'graphql',
  html = 'html',
  json = 'jsonls',
  javascript = 'tsserver',
  lua = 'lua_ls',
  rust = 'rust_analyzer',
  -- tailwindcss = 'tailwindcss',
  typescript = 'tsserver',
  viml = 'vimls',
  yaml = 'yamlls',
}

local default_language_server_config = {
  [server_name_language_map.lua] = require('user.lsp.settings.lua'),

  [server_name_language_map.css] = {
    capabilities = gen_capabilities_with_snippet_support(),
  },

  [server_name_language_map.html] = {
    capabilities = gen_capabilities_with_snippet_support(),
  },

  [server_name_language_map.json] = require('user.lsp.settings.json'),

  [server_name_language_map.typescript] = {
    settings = {
      -- typescript = {
      --   inlayHints = {
      --     includeInlayParameterNameHints = 'all',
      --     includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      --     includeInlayFunctionParameterTypeHints = true,
      --     includeInlayVariableTypeHints = true,
      --     includeInlayPropertyDeclarationTypeHints = true,
      --     includeInlayFunctionLikeReturnTypeHints = true,
      --     includeInlayEnumMemberValueHints = true,
      --   }
      -- },
      -- javascript = {
      --   inlayHints = {
      --     includeInlayParameterNameHints = 'all',
      --     includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      --     includeInlayFunctionParameterTypeHints = true,
      --     includeInlayVariableTypeHints = true,
      --     includeInlayPropertyDeclarationTypeHints = true,
      --     includeInlayFunctionLikeReturnTypeHints = true,
      --     includeInlayEnumMemberValueHints = true,
      --   }
      -- }
    }
  },

  -- [server_name_language_map.tailwindcss] = {},

  [server_name_language_map.viml] = {},

  [server_name_language_map.yaml] = {},

  [server_name_language_map.bash] = {},

  [server_name_language_map.css] = {},

  -- [server_name_language_map.eslint] = {},

  [server_name_language_map.emmet] = {},

  -- [server_name_language_map.graphql] = {},

  [server_name_language_map.rust] = {},
}

local ensure_installed_lsp = {
  server_name_language_map.bash,
  server_name_language_map.css,
  -- server_name_language_map.eslint,
  server_name_language_map.emmet,
  -- server_name_language_map.graphql,
  server_name_language_map.html,
  server_name_language_map.json,
  server_name_language_map.javascript,
  server_name_language_map.lua,
  server_name_language_map.rust,
  -- server_name_language_map.taiwindcss,
  server_name_language_map.typescript,
  server_name_language_map.viml,
  server_name_language_map.yaml,
}

local options = {
  installer = {
    ensure_installed = ensure_installed_lsp,
    automatic_installation = false,
    ui = {
      check_outdated_servers_on_open = true,
      border = 'rounded',
    },
  },
  default_mappings = false,
  mappings = {},
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  servers = default_language_server_config,
}

local function lsp_servers(opts)
  local servers = {}

  for server, config in pairs(default_language_server_config) do
    local server_name = require('mason-core.package').Parse(server)

    config = vim.tbl_deep_extend('keep', config, {
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,
      settings = {},
    })

    local capabilities = config.capabilities
    local ok, cmp = pcall(require, 'cmp_nvim_lsp')
    if ok then
      config.capabilities = cmp.default_capabilities(capabilities)
    end

    local on_attach = config.on_attach
    config.on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      -- copilot 自动补出来的，暂时用不上
      -- if client.resolved_capabilities.document_formatting then
      --   vim.api.nvim_exec([[
      --     augroup Format
      --       autocmd! * <buffer>
      --       autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      --     augroup END
      --   ]], false)
      -- end
    end

    servers[server_name] = config
  end

  return servers
end

local servers = lsp_servers(options)
if vim.api.nvim_get_commands({})['Mason'] == nil then
  require('mason').setup()
end
require('mason-lspconfig').setup({
  ensure_installed = _.keys(options.servers),
})
require('mason-lspconfig').setup_handlers({
  function(server_name)
    local config = servers[server_name] or {}
    -- local ok, coq = pcall(require, 'coq')
    -- if ok then
    --   config = coq.lsp_ensure_capabilities(config)
    -- end
    require('lspconfig')[server_name].setup(config)
  end
})
