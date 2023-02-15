local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
require("harpoon").setup({
  global_settings = {
    menu = {
      width = 100
    },
    mark_branch = true,
  }
})

vim.keymap.set("n", "<leader>a", function() mark.add_file() end)
vim.keymap.set("n", "<c-e>", function() ui.toggle_quick_menu() end)
vim.keymap.set("n", "<c-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<c-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<c-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<c-l>", function() ui.nav_file(4) end)
