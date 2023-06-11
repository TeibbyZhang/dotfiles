local vim = vim
local M = {}

function M.set_keymap(mode, from, to, opts)
  vim.keymap.set(mode, from, to, opts)
end

function M.set_common_keymap(mode, from, to)
  local opts = { noremap = true, silent = false }
  M.set_keymap(mode, from, to, opts)
end

function M.set_options(options)
  for key, val in pairs(options) do
    vim.opt[key] = val
  end
end

return M
