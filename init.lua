local o = vim.o
local cmd = vim.cmd
local g = vim.g

cmd('autocmd BufWritePost init.lua source <afile>')

require 'mappings'
require 'options'
require 'colours'
require 'misc'
require 'plugins.packer'
