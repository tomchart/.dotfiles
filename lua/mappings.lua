local g = vim.g
local api = vim.api
local cmd = vim.cmd

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
-- thanks again marcus, these are tight as fuck
map('n', 'gk', 'gg')
map('v', 'gk', 'gg')
map('n', 'gj', 'G')
map('v', 'gj', 'G')
map('n', 'gh', '^')
map('v', 'gh', '^')
map('n', 'gl', '$')
map('v', 'gl', 'g_')

-- copy to end of line from current pos with Y
map('n', 'Y', 'y$')



-------------------------------------------------------
-- plugin mappings
-------------------------------------------------------
-- nvim-tree.lua
map('n', '<c-n>', '<cmd>NvimTreeToggle<cr>')


