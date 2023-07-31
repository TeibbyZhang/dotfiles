local M = {}

local wk = require('which-key')
local wk_leader_key_map = require('base_key_mapping').wk_leader_key_map

wk.register(wk_leader_key_map, {
  prefix = '<Leader>',
})

wk.setup({})

return M

