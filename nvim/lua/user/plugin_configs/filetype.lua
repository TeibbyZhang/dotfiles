local opts = {
  overrides = {
    extensions = {
      sql = 'sql',
    }
  },
}

require('filetype').setup(opts)
