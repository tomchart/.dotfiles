local o = vim.o
local opt = vim.opt_global

o.mouse = "a"
o.ignorecase = true
o.smartcase = true
o.termguicolors = true
o.cursorline = true
o.swapfile = false
o.splitbelow = true
o.splitright = true
o.showtabline = 0
o.number = true
o.hidden = true
o.showmode = false
o.showmatch = true
o.signcolumn = "yes"
o.swapfile = false
o.updatetime = 1000
o.scrolloff = 10
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.relativenumber = true
-- vim.g.do_filetype_lua = 1
vim.wo.colorcolumn = "99999" -- fix annoying indent artifacts bug
-- vim.lsp.set_log_level("debug")

-- telescopic johnson formatoptions
opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

vim.g.PHP_autoformatcomment = 0
vim.g.slime_target = "tmux"
vim.g.slime_paste_file = "/home/tom/.slime_paste"
vim.g.slime_no_mappings = 1

-- disable some builtin vim plugins
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
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
