local g = vim.g
local api = vim.api
local cmd = vim.cmd
local keymap = vim.keymap.set

cmd('autocmd BufWritePost keymappings.lua source <afile>')

g.keymapleader = ' '


-- TODO - fix some bindings that are now broken from using keymap


-------------------------------------------------------
-- moving around, tabs, windows, and buffers
-------------------------------------------------------
-- in insert mode, jj exits this mode
keymap('i', 'jj', '<esc>')

-- <leader><cr> hides highlight
keymap('n', '<leader><cr>', ':noh<cr>')

-- some comfort binds
-- (thanks again marcus, these are tight as fuck)
keymap('n', 'gk', 'gg')
keymap('v', 'gk', 'gg')
keymap('n', 'gj', 'G')
keymap('v', 'gj', 'G')
keymap('n', 'gh', '^')
keymap('v', 'gh', '^')
keymap('n', 'gl', '$')
keymap('v', 'gl', 'g_')

-- move & manipulate windows
keymap('n', '<c-j>', '<c-w>j')
keymap('n', '<c-k>', '<c-w>k')
keymap('n', '<c-l>', '<c-w>l')
keymap('n', '<c-h>', '<c-w>h')
keymap('n', '<c-w>j', '<c-w>J')
keymap('n', '<c-w>k', '<c-w>K')
keymap('n', '<c-w>l', '<c-w>L')
keymap('n', '<c-w>h', '<c-w>H')
keymap('n', '<c-w><', '<c-w>5<')
keymap('n', '<c-w>>', '<c-w>5>')
keymap('n', '<c-w>-', '<c-w>5-')
keymap('n', '<c-w>=', '<c-w>5+')
keymap('n', '<c-w>e', '<c-w>=')

-- close buffer
keymap('n', '<leader>dd', '<cmd>Bdelete<cr>')

-- quit binds for comfort
keymap('i', '<c-Q>', '<esc>:q<cr>')
keymap('n', '<c-Q>', ':q<cr>')
keymap('v', '<c-Q>', '<esc>')
keymap('n', '<leader>q', ':q<cr>')
keymap('n', '<leader>Q', ':qa!<cr>')

-- copy to end of line from current pos with Y
keymap('n', 'Y', 'y$')

-- qq to record, Q to replay
keymap('n', 'Q', '@q')

-- rekeymap jumplist to <leader>o and <leader>i
keymap('n', '<leader>o', '<c-o>')
keymap('n', '<leader>i', '<tab>')


-------------------------------------------------------
-- plugin keymappings
-------------------------------------------------------
-- nvim-tree.lua
keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>')
keymap('n', '<leader>n', '<cmd>NvimTreeToggle<cr>')
keymap('n', '<leader>r', '<cmd>NvimTreeRefresh<cr>')

-- telescope.nvim
keymap('n', '<c-p>', '<cmd>Telescope find_files<cr>')
keymap('n', '<c-b>', '<cmd>Telescope buffers<cr>')
keymap('n', '<c-f>', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
keymap('n', '<c-g>', '<cmd>Telescope live_grep<cr>')
keymap('n', 'gd', '<cmd>Telescope lsp_definitions<cr>')
keymap('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')
keymap('n', '<c-o>', '<cmd>Telescope oldfiles<cr>')
keymap('n', '<c-d>', '<cmd>Telescope git_status<cr>')

-- nvim-bufferline.lua
keymap('n', 'L', '<cmd>BufferLineCycleNext<cr>')
keymap('n', 'H', '<cmd>BufferLineCyclePrev<cr>')

-- nvim-lspconfig
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

-- trouble
keymap('n', '<leader>xx', '<cmd>Trouble<cr>')
keymap('n', '<leader>xd', '<cmd>Trouble document_diagnostics<cr>')
