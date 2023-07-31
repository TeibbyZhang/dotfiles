vim.g.nord_cursor_line_number_background = 1
vim.g.nord_uniform_diff_background = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1

require('catppuccin').setup({
  transparent_background = true,
  term_colors = true,
  integrations = {
    notify = true,
    hop = true,
    mason = true,
    treesitter_context = true,
    which_key = true,
    lsp_trouble = true,
  },
})

vim.cmd.colorscheme('catppuccin')
