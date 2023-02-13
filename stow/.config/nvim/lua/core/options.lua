local o = vim.o

-- behaviour
o.swapfile = false
o.inccommand = "nosplit"
o.grepprg = "rg --vimgrep --smart-case --no-heading" -- search with rg
o.grepformat = "%f:%l:%c:%m" -- filename:line number:column number:error message
o.updatetime = 250 -- too low causes issues it seems

-- indentation
o.autoindent = true -- continue indentation to new line
o.smartindent = true -- add extra indent when it makes sense
o.smarttab = true -- tab at start of line behaves as expected
o.expandtab = true -- tab inserts spaces
o.shiftwidth = 2 -- shift line by 2 spaces
o.tabstop = 2 -- tab appears as 2 spaces
o.softtabstop = 2 -- tab behaves like 2 spaces when editing

-- clipboard
o.clipboard = 'unnamed'

-- colors
o.termguicolors = true
-- o.background = "dark"
-- o.colorscheme -- theme is set elsewhere

-- look and feel
o.mouse = "nv"
o.cursorline = true -- hl current line
o.splitbelow = true -- natural window splitting
o.splitright = true -- more natural window splitting
o.showtabline = 0 -- hide tabline
o.hidden = true -- dont abandon buffers or something
o.showmode = false -- feline does this for us
o.showmatch = true -- show matching brackets briefly
o.signcolumn = "yes" -- always show the sign column
o.scrolloff = 10 -- 10 lines of padding from screen top/bot to cursor
o.number = true -- display line numbers
o.relativenumber = true -- relative line numbers son

-- search
o.ignorecase = true -- case insensitive search..
o.smartcase = true -- ... unless caps used
o.hlsearch = true -- highlight matching text
o.incsearch = true -- update results as typing
o.wildmenu = true -- tab complete on command line

-- vim.wo.colorcolumn = "99999" -- fix annoying indent artifacts bug

vim.g.PHP_autoformatcomment = 0 -- do not continue comments when using o in PHP

-- disable some builtin vim plugins
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
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
