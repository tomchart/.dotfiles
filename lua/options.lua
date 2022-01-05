local cmd = vim.cmd
local o = vim.o

cmd('packadd dracula')
cmd('colorscheme dracula')

o.expandtab = true
o.mouse = 'a'
o.smartcase = true
o.ignorecase = true
o.termguicolors = true
o.cursorline = true
o.swapfile = false
o.splitbelow = true
o.splitright = true
o.showtabline = 2
o.tabstop = 4
o.number = true
vim.wo.colorcolumn = "99999"    -- fix annoying indent artifacts bug
-- vim.lsp.set_log_level("debug")
