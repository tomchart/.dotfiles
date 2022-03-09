local M = {}

M.indent = function()
	local default = {
		indentLine_enabled = 1,
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
		show_current_context = true,
	}
	require("indent_blankline").setup(default)
end

M.autopairs = function()
	local present1, autopairs = pcall(require, "nvim-autopairs")
	local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

	if present1 and present2 then
		local default = { fast_wrap = {} }
		autopairs.setup(default)

		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end
end

return M
