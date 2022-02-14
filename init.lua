local cmd = vim.cmd

cmd('autocmd BufWritePost init.lua source <afile>')

require 'mappings'
require 'options'
require 'colours'
require 'misc'
require 'plugins.packer'
