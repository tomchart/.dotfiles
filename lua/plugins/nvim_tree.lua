local g = vim.g
local tree_cb = require('nvim-tree.config').nvim_tree_callback

g.nvim_tree_quit_on_open = 0
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_group_empty = 1

require 'nvim-tree'.setup()
