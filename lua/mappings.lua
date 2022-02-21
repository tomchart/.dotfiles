local g = vim.g
local cmd = vim.cmd
local keymap = vim.keymap.set

local telescope = require("telescope.builtin")
local nvim_tree = require("nvim-tree")

-- write on edit
cmd("autocmd BufWritePost mappings.lua source <afile>")

-- set leader to space
g.mapleader = " "

-------------------------------------------------------
-- moving around, tabs, windows, and buffers
-------------------------------------------------------
-- in insert mode, jj exits this mode
keymap("i", "jj", "<esc>")
keymap("t", "jj", "<c-\\><c-n>")

-- <leader><cr> hides highlight
keymap("n", "<leader><cr>", ":noh<cr>")

-- some comfort binds
-- (thanks again marcus, these are tight as fuck)
keymap("n", "gk", "gg")
keymap("v", "gk", "gg")
keymap("n", "gj", "G")
keymap("v", "gj", "G")
keymap("n", "gh", "^")
keymap("v", "gh", "^")
keymap("n", "gl", "$")
keymap("v", "gl", "g_")

-- move & manipulate windows
keymap("n", "<c-j>", "<c-w>j")
keymap("n", "<c-k>", "<c-w>k")
keymap("n", "<c-l>", "<c-w>l")
keymap("n", "<c-h>", "<c-w>h")
keymap("n", "<tab>j", "<c-w>J")
keymap("n", "<tab>k", "<c-w>K")
keymap("n", "<tab>l", "<c-w>L")
keymap("n", "<tab>h", "<c-w>H")
keymap("n", "<tab><", "<c-w>5<")
keymap("n", "<tab>>", "<c-w>5>")
keymap("n", "<tab>-", "<c-w>5-")
keymap("n", "<tab>=", "<c-w>5+")
keymap("n", "<tab>e", "<c-w>=")
keymap("n", "<tab>v", "<c-w>v")
keymap("n", "<tab>h", "<c-w>s")
keymap("n", "<tab>q", "<c-w>q")

-- close buffer
keymap("n", "<c-w>", "<cmd>Bdelete<cr>")

-- quit binds for comfort
keymap("i", "<c-Q>", "<esc>:q<cr>")
keymap("n", "<c-Q>", ":q<cr>")
keymap("v", "<c-Q>", "<esc>")
keymap("n", "<leader>q", ":q<cr>")
keymap("n", "<leader>Q", ":qa!<cr>")

-- copy to end of line from current pos with Y
keymap("n", "Y", "y$")

-- qq to record, Q to replay
keymap("n", "Q", "@q")

-- rekeymap jumplist to <leader>o and <leader>i
keymap("n", "<leader>o", "<c-o>")
keymap("n", "<leader>i", "<tab>")

-- open terminal with <c-t>
keymap("n", "<c-t>", "<cmd>terminal<cr>")

-------------------------------------------------------
-- plugin keymappings
-------------------------------------------------------
-- nvim-tree.lua
keymap("n", "<c-n>", nvim_tree.toggle)
keymap("n", "<leader>n", nvim_tree.toggle)

-- telescope.nvim
keymap("n", "<c-p>", telescope.find_files)
keymap("n", "<c-b>", telescope.buffers)
keymap("n", "<c-f>", telescope.current_buffer_fuzzy_find)
keymap("n", "<c-g>", telescope.live_grep)
keymap("n", "<c-o>", telescope.oldfiles)
keymap("n", "<leader>c", telescope.git_commits)
keymap("n", "<leader>h", telescope.git_branches)
keymap("n", "<leader>r", telescope.resume)
keymap("n", "<leader>d", telescope.lsp_definitions)
keymap("n", "<leader>s", telescope.git_status)

-- nvim-bufferline.lua
keymap("n", "L", "<cmd>BufferLineCycleNext<cr>")
keymap("n", "H", "<cmd>BufferLineCyclePrev<cr>")

-- nvim-lspconfig
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

-- trouble
keymap("n", "<leader>xx", "<cmd>Trouble<cr>")
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
