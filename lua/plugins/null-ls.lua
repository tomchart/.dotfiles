local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.sqlformat,
	null_ls.builtins.diagnostics.flake8,
	null_ls.builtins.diagnostics.mypy,
	null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({
	sources = sources,
	log = {
		enable = true,
		level = "warn",
		use_console = false,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
