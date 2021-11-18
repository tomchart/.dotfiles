local g = vim.g
local api = vim.api
local cmd = vim.cmd

cmd('autocmd BufWritePost mappings.lua source <afile>')

g.mapleader = ' '

-- nicked this nice func from marcus
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

map('i', 'jj', '<esc>')

-- nvim-tree.lua
map('n', '<c-n>', '<cmd>NvimTreeToggle<cr>')

