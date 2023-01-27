-- autopairs
require("nvim-autopairs").setup({
  fast_wrap = {},
})

-- cmp autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())


-- leap
local leap = require("leap")
leap.setup({
  case_insensitive = true,
})
leap.set_default_keymaps()
