local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn', 'info'},
  symbols = { error = ' ', warn = ' ', info = ' '  },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  'diff',
  colored = false,
  symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
  cond = hide_in_width
}

local file_name = {
  'filename',
  file_status = true, -- Displays file status (readonly status, modified status)
  path = 1,
  -- 0: Just the filename
  -- 1: Relative path
  -- 2: Absolute path

  shorting_target = 40, -- Shortens path to leave 40 spaces in the window
  -- for other components. (terrible name, any suggestions?)
  symbols = {
    modified = '[+]', -- Text to show when the file is modified.
    readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
  },
}

local branch = {
  'branch',
  icons_enabled = true,
  icon = '',
}

local location = {
  'location',
  padding = 0,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')
  local chars = { '__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██' }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

local setup_opts = {
  options = {
    theme = 'nord',
    always_divide_middle = false,
    disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
  },
  extensions = {
    'nvim-tree',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { branch, diff, diagnostics },
    lualine_c = { file_name },
    lualine_x = { spaces, 'encoding', 'filetype', 'fileformat' },
    lualine_y = { progress },
    lualine_z = { location },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { file_name },
    lualine_x = { location },
    lualine_y = {},
    lualine_z = {},
  },
}

require('lualine').setup(setup_opts)

