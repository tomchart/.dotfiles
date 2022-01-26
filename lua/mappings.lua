local g = vim.g
local api = vim.api
local cmd = vim.cmd
local gs = package.loaded.gitsigns

cmd('autocmd BufWritePost mappings.lua source <afile>')

g.mapleader = ' '

-- nicked this func from marcus
local function map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true,
  }
  if opts then
    for k, v in pairs(opts) do options[k] = v end
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end


-------------------------------------------------------
-- moving around, tabs, windows, and buffers
-------------------------------------------------------
-- in insert mode, jj exits this mode
map('i', 'jj', '<esc>')

-- <leader><cr> hides highlight
map('n', '<leader><cr>', ':noh<cr>')

-- some comfort binds
-- (thanks again marcus, these are tight as fuck)
map('n', 'gk', 'gg')
map('v', 'gk', 'gg')
map('n', 'gj', 'G')
map('v', 'gj', 'G')
map('n', 'gh', '^')
map('v', 'gh', '^')
map('n', 'gl', '$')
map('v', 'gl', 'g_')

-- move & manipulate windows
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')
map('n', '<c-h>', '<c-w>h')
map('n', '<c-w>j', '<c-w>J')
map('n', '<c-w>k', '<c-w>K')
map('n', '<c-w>l', '<c-w>L')
map('n', '<c-w>h', '<c-w>H')
map('n', '<c-w><', '<c-w>5<')
map('n', '<c-w>>', '<c-w>5>')
map('n', '<c-w>-', '<c-w>5-')
map('n', '<c-w>=', '<c-w>5+')
map('n', '<c-w>e', '<c-w>=')

-- close buffer
map('n', '<leader>dd', '<cmd>bdelete<cr>')

-- quit binds for comfort
map('i', '<c-Q>', '<esc>:q<cr>')
map('n', '<c-Q>', ':q<cr>')
map('v', '<c-Q>', '<esc>')
map('n', '<leader>q', ':q<cr>')
map('n', '<leader>Q', ':qa!<cr>')

-- copy to end of line from current pos with Y
map('n', 'Y', 'y$')

-- qq to record, Q to replay
map('n', 'Q', '@q')

-- remap jumplist to <leader>o and <leader>i
map('n', '<leader>o', '<c-o>')
map('n', '<leader>i', '<tab>')


-------------------------------------------------------
-- plugin mappings
-------------------------------------------------------
-- nvim-tree.lua
map('n', '<c-n>', '<cmd>NvimTreeToggle<cr>')
map('n', '<leader>n', '<cmd>NvimTreeToggle<cr>')
map('n', '<leader>r', '<cmd>NvimTreeRefresh<cr>')

-- telescope.nvim
map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('n', '<c-b>', '<cmd>Telescope buffers<cr>')
map('n', '<c-f>', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
map('n', '<c-g>', '<cmd>Telescope live_grep<cr>')
map('n', 'gd', '<cmd>Telescope lsp_definitions<cr>')
map('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')
map('n', '<c-o>', '<cmd>Telescope oldfiles<cr>')
map('n', '<c-d>', '<cmd>Telescope git_status<cr>')

-- nvim-bufferline.lua
map('n', 'L', '<cmd>BufferLineCycleNext<cr>')
map('n', 'H', '<cmd>BufferLineCyclePrev<cr>')

-- nvim-lspconfig
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

-- trouble
map('n', '<leader>xx', '<cmd>Trouble<cr>')
map('n', '<leader>xd', '<cmd>Trouble document_diagnostics<cr>')

-- gitsigns
    -- -- navigation
    -- local function lua_map(mode, l, r, opts)
    --   opts = opts or {}
    --   opts.buffer = bufnr
    --   vim.keymap.set(mode, l, r, opts)
    -- end
    -- lua_map('n', '<leader>hj', "&diff ? '<leader>hj' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    -- lua_map('n', '<leader>hk', "&diff ? '<leader>hk' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- -- actions
    -- lua_map({'n', 'v'}, '<leader>hs', gs.stage_hunk)
    -- lua_map({'n', 'v'}, '<leader>hr', gs.reset_hunk)
    -- lua_map('n', '<leader>hS', gs.stage_buffer)
    -- lua_map('n', '<leader>hu', gs.undo_stage_hunk)
    -- lua_map('n', '<leader>hR', gs.reset_buffer)
    -- lua_map('n', '<leader>hp', gs.preview_hunk)
    -- lua_map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    -- lua_map('n', '<leader>tb', gs.toggle_current_line_blame)
    -- lua_map('n', '<leader>hd', gs.diffthis)
    -- lua_map('n', '<leader>hD', function() gs.diffthis('~') end)
    -- lua_map('n', '<leader>td', gs.toggle_deleted)

    -- -- Text object
    -- lua_map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
