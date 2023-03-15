local treesitter_context = require('treesitter-context')

treesitter_context.setup({
  enable = true,
  throttle = true,
  max_lines = 0,
  patterns = {
    default = {
      'class',
      'function',
      'method',
      'switch',
      'while',
    },
  },
})
