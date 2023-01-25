-- local wrapper for mapping, with default opts
-- @param mode string
-- @param lhs string
-- @param rhs string|function
-- @param opts table|nil
local keymap = function(mode, lhs, rhs, opts)
  if opts then
    vim.keymap.set(mode, lhs, rhs, opts)
  else
    vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true })
  end
end

local M = {}

M.misc = function()
  local function non_config_mappings()
    -- copy to end of line from current pos with Y
    keymap("n", "Y", "y$")
  end

  local function comfort()
    -- set leader to space
    vim.g.mapleader = " "

    -- remap ; to : (always miss it)
    keymap("n", ";", ":")

    -- remap increment (tmux bad)
    keymap("n", "<c-c>", "<c-a>")

    -- source current file with <leader>S
    keymap("n", "<leader>S", ":so %<cr>")

    -- rekeymap jumplist to <leader>o and <leader>i
    keymap("n", "<leader>o", "<c-o>")
    keymap("n", "<leader>i", "<tab>")

    -- in insert mode, jj exits this mode
    keymap("i", "jj", "<esc>")
    keymap("t", "jj", "<c-\\><c-n>")

    -- <leader><cr> hides highlight
    keymap("n", "<leader><cr>", ":noh<cr>")

    -- qq to record, Q to replay
    keymap("n", "Q", "@q")

    -- line movement
    keymap("n", "gk", "gg")
    keymap("v", "gk", "gg")
    keymap("n", "gj", "G")
    keymap("v", "gj", "G")
    keymap("n", "gh", "^")
    keymap("v", "gh", "^")
    keymap("n", "gl", "$")
    keymap("v", "gl", "g_")

    -- prime recentering
    keymap("n", "<c-u>", "<c-u>zz")
    keymap("n", "<c-d>", "<c-d>zz")
    keymap("n", "n", "nzz")
    keymap("n", "N", "Nzz")

  end

  local function windows_buffers()
    -- move & manipulate windows
    -- keymap("n", "<c-j>", "<c-w>j")
    -- keymap("n", "<c-k>", "<c-w>k")
    -- keymap("n", "<c-l>", "<c-w>l")
    -- keymap("n", "<c-h>", "<c-w>h")
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
    keymap("n", "<tab>_", "<c-w>_")
    keymap("n", "<tab>|", "<c-w>|")

    -- close buffer
    -- keymap("n", "<c-w>", "<cmd>Bdelete<cr>")

    -- prev buffer comfort
    keymap("n", "<leader>p", "<c-6>")
  end

  non_config_mappings()
  comfort()
  windows_buffers()
end

return M
