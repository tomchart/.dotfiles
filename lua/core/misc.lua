local cmd = vim.cmd

-- jump to last position when opening a file
cmd([[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- set filetype when terminal opened
cmd([[autocmd TermOpen * :lua require('utils').change_terminal_filetype()]])

-- no comment markers on newlines from commented line
cmd([[autocmd FileType c,cpp setlocal formatoptions-=r]])

-- run eslint on file save
-- cmd([[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]])

-- highlight yanked text
cmd[[au TextYankPost * silent! lua vim.highlight.on_yank()]]
