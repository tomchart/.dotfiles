local o = vim.o

o.mouse = "a"
o.ignorecase = true
o.termguicolors = true
o.cursorline = true
o.swapfile = false
o.splitbelow = true
o.splitright = true
o.showtabline = 2
o.number = true
o.hidden = true
o.showmode = false
o.signcolumn = "yes"
o.swapfile = false
o.updatetime = 100
o.scrolloff = 5
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.relativenumber = true
vim.wo.colorcolumn = "99999" -- fix annoying indent artifacts bug
-- vim.lsp.set_log_level("debug")

-- disable some builtin vim plugins
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
