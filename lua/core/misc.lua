local cmd = vim.cmd

-- jump to last position when opening a file
cmd([[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- set filetype when terminal opened
cmd([[autocmd TermOpen * :lua require('utils').change_terminal_filetype()]])
