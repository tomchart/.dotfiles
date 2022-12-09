local M = {}

M.indent = function()
	local default = {
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
		-- show_current_context = true,
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

M.escape = function()
	local present, escape = pcall(require, "better-escape.nvim")
	if not present then
		return
	end

	require(escape).setup({
		mapping = "jj",
	})
end

M.luasnip = function()
	local present, luasnip = pcall(require, "luasnip")
	if present then
		local default = {
			history = true,
			updateevents = "TextChanged,TextChangedI",
		}
		luasnip.config.set_config(default)
        luasnip.filetype_extend("javascript", { "javascriptreact" })
        luasnip.filetype_extend("javascript", { "html" })
		require("luasnip/loaders/from_vscode").load()
	end
end

M.leap = function()
    local present, leap = pcall(require, "leap")
    if present then
        leap.setup({
            case_insensitive = true,
        })
        leap.set_default_keymaps()
    end
end

return M
