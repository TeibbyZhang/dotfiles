local gen_capabilities_with_snippet_support = require('user.lsp.utils').gen_capabilities_with_snippet_support
-- local lsp_installer = require('nvim-lsp-installer')
-- local servers = require('nvim-lsp-installer.servers')
local on_attach = require('user.lsp.handler').on_attach

-- local default_install_languages = {
--   'bash',
--   'css',
--   -- maybe donot need
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
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        }
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        }
      }
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

  [server_name_language_map.rust] = require('lsp-setup.rust-tools').setup({
    tools = {
      inlay_hints = {
        auto = false,
      },
    },
  }),
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

local opts = {
  installer = {
    ensure_installed = ensure_installed_lsp,
    automatic_installation = false,
    ui = {
      check_outdated_servers_on_open = true,
      border = 'rounded',
    },
  },
  default_mappings = false,
  mappings = {
    -- gD = 'lua vim.lsp.buf.declaration()',
    -- gd = 'lua vim.lsp.buf.definition()',
    -- gi = 'lua vim.lsp.buf.implementation()',
    -- gr = 'lua vim.lsp.buf.references()',
    -- ['<Leader>wa'] = 'lua vim.lsp.buf.add_workspace_folder()',
    -- ['<Leader>wr'] = 'lua vim.lsp.buf.remove_workspace_folder()',
    -- ['<Leader>do'] = 'lua vim.diagnostic.open_float()',
    -- ['<Leader>wl'] = 'lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))',
    -- ['<Leader>cf'] = 'lua vim.lsp.buf.formatting()',
    -- gp = 'lua require"lspsaga.provider".preview_definition()',
    -- K = 'lua require("lspsaga.hover").render_hover_doc()',
    -- ['<C-f>'] = 'lua require("lspsaga.action").smart_scroll_with_saga(1)',
    -- ['<C-b>'] = 'lua require("lspsaga.action").smart_scroll_with_saga(-1)',
    -- gs = 'lua require("lspsaga.signaturehelp").signature_help()',
    -- ['<Leader>rn'] = 'lua require("lspsaga.rename").rename()',
    -- ['<Leader>ca'] = 'lua require("lspsaga.codeaction").code_action()',
    -- ['<Leader>dl'] = 'lua require"lspsaga.diagnostic".show_line_diagnostics()',
    -- ['<Leader>dc'] = 'lua require"lspsaga.diagnostic".show_cursor_diagnostics()',
    -- ['[d'] = 'lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()',
    -- [']d'] = 'lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()',
  },
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  servers = default_language_server_config,
}

require('lsp-setup').setup(opts)

