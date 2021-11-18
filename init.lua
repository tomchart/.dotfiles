local o = vim.o
local cmd = vim.cmd
local g = vim.g

cmd('autocmd BufWritePost init.lua source <afile>')

require 'plugins.packer'
require 'mappings'

cmd('packadd dracula')
cmd('colorscheme dracula')

-- options
o.smartcase = true
o.termguicolors = true
