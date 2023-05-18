    -- copy to end of line from current pos with Y
    vim.keymap.set("n", "Y", "y$")

    -- remap ; to : (always miss it)
    vim.keymap.set("n", ";", ":")

    -- remap increment (tmux bad)
    vim.keymap.set("n", "<c-c>", "<c-a>")

    -- source current file with <leader>S
    vim.keymap.set("n", "<leader>S", ":so %<cr>")

    -- revim.keymap.set jumplist to <leader>o and <leader>i
    vim.keymap.set("n", "<leader>o", "<c-o>zz")
    vim.keymap.set("n", "<leader>i", "<tab>zz")

    -- in insert mode, jj exits this mode
    vim.keymap.set("i", "jj", "<esc>")
    vim.keymap.set("t", "jj", "<c-\\><c-n>")

    -- <leader><cr> hides highlight
    vim.keymap.set("n", "<leader><cr>", ":noh<cr>", { silent = true })

    -- qq to record, Q to replay
    vim.keymap.set("n", "Q", "@q")

    -- line movement
    vim.keymap.set("n", "gk", "gg")
    vim.keymap.set("v", "gk", "gg")
    vim.keymap.set("n", "gj", "G")
    vim.keymap.set("v", "gj", "G")
    vim.keymap.set("n", "gh", "^")
    vim.keymap.set("v", "gh", "^")
    vim.keymap.set("n", "gl", "$")
    vim.keymap.set("v", "gl", "g_")

    -- prime recentering
    vim.keymap.set("n", "<c-u>", "<c-u>zz")
    vim.keymap.set("n", "<c-d>", "<c-d>zz")
    vim.keymap.set("n", "n", "nzz")
    vim.keymap.set("n", "N", "Nzz")


    -- move & manipulate windows
    -- vim.keymap.set("n", "<c-j>", "<c-w>j")
    -- vim.keymap.set("n", "<c-k>", "<c-w>k")
    -- vim.keymap.set("n", "<c-l>", "<c-w>l")
    -- vim.keymap.set("n", "<c-h>", "<c-w>h")
    vim.keymap.set("n", "<tab>j", "<c-w>J")
    vim.keymap.set("n", "<tab>k", "<c-w>K")
    vim.keymap.set("n", "<tab>l", "<c-w>L")
    vim.keymap.set("n", "<tab>h", "<c-w>H")
    vim.keymap.set("n", "<tab><", "<c-w>5<")
    vim.keymap.set("n", "<tab>>", "<c-w>5>")
    vim.keymap.set("n", "<tab>-", "<c-w>5-")
    vim.keymap.set("n", "<tab>=", "<c-w>5+")
    vim.keymap.set("n", "<tab>e", "<c-w>=")
    vim.keymap.set("n", "<tab>v", "<c-w>v")
    vim.keymap.set("n", "<tab>h", "<c-w>s")
    vim.keymap.set("n", "<tab>q", "<c-w>q")
    vim.keymap.set("n", "<tab>_", "<c-w>_")
    vim.keymap.set("n", "<tab>|", "<c-w>|")

    -- close buffer
    -- vim.keymap.set("n", "<c-w>", "<cmd>Bdelete<cr>")

    -- prev buffer comfort
    vim.keymap.set("n", "<leader>p", "<c-6>")

    -- remap % to <c-m>
    vim.keymap.set("n", "<c-m>", "<Plug>(MatchitNormalForward)")
