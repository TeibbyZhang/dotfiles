-- use nvim_cmp need vim completeopt option be set as 'menuone,noselect'

local M = {}

function M.setup()
  -- nvim-cmp setup
  local cmp = require 'cmp'
  -- luasnip setup
  local luasnip = require 'luasnip'

  -- autopairs setting for nvim_cmp
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')

  CMP_CONFIG = {
    completion = {
      keyword_length = 1,
    },
    view = {
      entries = "custom",
    },
    experimental = {
      ghost_text = {
        hl_group = 'Comment',
      },
    },
    formatting = {
      fields = { 'abbr', 'kind', 'menu' },
      kind_icons = {
        Class = " ",
        Color = " ",
        Constant = "ﲀ ",
        Constructor = " ",
        Enum = "練",
        EnumMember = " ",
        Event = " ",
        Field = " ",
        File = "",
        Folder = " ",
        Function = " ",
        Interface = "ﰮ ",
        Keyword = " ",
        Method = " ",
        Module = " ",
        Operator = "",
        Property = " ",
        Reference = " ",
        Snippet = " ",
        Struct = " ",
        Text = " ",
        TypeParameter = " ",
        Unit = "塞",
        Value = " ",
        Variable = " ",
        Copilot = "",
      },
      source_names = {
        copilot = '(Copilot)',
        nvim_lsp = '(LSP)',
        emoji = '(Emoji)',
        path = '(Path)',
        calc = '(Calc)',
        cmp_tabnine = '(Tabnine)',
        luasnip = '(Snippet)',
        buffer = '(Buffer)',
        cmdline = '(Cmdline)',
        spell = '(Spell)',
      },
      duplicates = {
        buffer = 1,
        path = 1,
        nvim_lsp = 0,
        luasnip = 1,
      },
      duplicates_default = 0,
      format = function(entry, vim_item)
        vim_item.kind = CMP_CONFIG.formatting.kind_icons[vim_item.kind]
        vim_item.menu = CMP_CONFIG.formatting.source_names[entry.source.name]
        vim_item.dup = CMP_CONFIG.formatting.duplicates[entry.source.name] or CMP_CONFIG.formatting.duplicates_default
        return vim_item
      end,
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    sources = cmp.config.sources({
      { name = 'copilot' },
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'luasnip' },
      { name = 'cmp_tabnine' },
      { name = 'nvim_lua' },
      { name = 'buffer' },
      { name = 'calc' },
      { name = 'emoji' },
      { name = 'treesitter' },
      { name = 'crates' },
    }),
    mapping = cmp.mapping.preset.insert({
      ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping({
        -- i = cmp.mapping.abort(),
        i = cmp.mapping.close(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
    }),
  }

  require('luasnip.loaders.from_vscode').lazy_load()
  cmp.setup(CMP_CONFIG)

  -- map cr for nvim_cmp setup
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
        { name = 'cmdline' }
      })
  })
end

return M

