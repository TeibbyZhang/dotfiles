local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require('packer')
local plugins = require('plugin_list').plugin_list

local config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
  profile = {
    enable = true,
    threshold = 1,
  },
}

vim.cmd [[packadd packer.nvim]]

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua,plugin_list.lua source <afile> | PackerCompile
  augroup end
]], false)

packer.reset()
packer.init(config)

return packer.startup({
  function(use)
    for _, plugin in ipairs(plugins) do
      use(plugin)
    end
    if packer_bootstrap then
      packer.sync()
    end
  end,
})
