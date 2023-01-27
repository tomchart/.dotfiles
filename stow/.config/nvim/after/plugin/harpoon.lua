require("harpoon").setup({
  menu = {
    width = 100
  }
})

vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
vim.keymap.set("n", "<c-e>", function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set("n", "<c-h>", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<c-j>", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<c-k>", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<c-l>", function() require("harpoon.ui").nav_file(4) end)
