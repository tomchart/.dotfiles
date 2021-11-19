local o = vim.o
local cmd = vim.cmd
local g = vim.g

cmd('autocmd BufWritePost init.lua source <afile>')

require 'plugins.packer'
require 'mappings'

-----------------------------------------------------
-- theme/colours
-----------------------------------------------------
cmd('packadd dracula')
cmd('colorscheme dracula')


-----------------------------------------------------
-- options
-----------------------------------------------------
o.smartcase = true
o.ignorecase = true
o.termguicolors = true
o.cursorline = true


-----------------------------------------------------
-- misc
-----------------------------------------------------
-- jump to last position when opening a file
cmd([[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])



