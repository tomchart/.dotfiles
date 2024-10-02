local cmd = vim.cmd

-- jump to last position when opening a file
cmd([[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- no comment markers on newlines from commented line
cmd([[autocmd FileType c,cpp setlocal formatoptions-=r]])

-- run eslint on file save
-- cmd([[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]])

-- highlight yanked text
cmd[[au TextYankPost * silent! lua vim.highlight.on_yank()]]

-- set blade.php to filetype html
cmd[[au BufRead,BufNewFile *.blade.php set filetype=html]]

-- clear cmdline if cursor moved (this will probably annoy me later)
cmd[[autocmd CursorMoved * echo]]

-- set colorcolumn lengths per filetype
cmd[[autocmd FileType php set colorcolumn=80]]
cmd[[autocmd FileType html set colorcolumn=100]]
