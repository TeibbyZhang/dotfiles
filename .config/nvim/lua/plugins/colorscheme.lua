return {
  {
    "catppuccin/nvim",
    name = 'catppuccin',
    opts = {
      transparent_background = true,
      term_colors = true,
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  }
}
