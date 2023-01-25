local M = {}

-- blanklines
require("indent_blankline").setup({
		enabled = 0,
		char = "▏",
		filetype_exclude = {
			"help",
			"terminal",
			"dashboard",
			"packer",
			"lspinfo",
			"TelescopePrompt",
			"TelescopeResults",
			"nvchad_cheatsheet",
		},
		buftype_exclude = { "terminal" },
		show_trailing_blankline_indent = false,
		show_first_indent_level = false,
})

-- autopairs
require("nvim-autopairs").setup({
  fast_wrap = {},
})

-- cmp autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())


-- -- better escape
-- require("better-escape.nvim").setup({
--   mapping = "jj",
-- })

-- luasnip
local luasnip = require("luasnip")
luasnip.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI"
})
luasnip.filetype_extend("javascript", { "javascriptreact" })
luasnip.filetype_extend("javascript", { "html" })
require("luasnip/loaders/from_vscode").load()

-- leap
local leap = require("leap")
leap.setup({
  case_insensitive = true,
})
leap.set_default_keymaps()
