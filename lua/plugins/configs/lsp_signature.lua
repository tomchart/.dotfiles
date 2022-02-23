local present, signature = pcall(require, "lsp_signature")
if not present then
	return
end

signature.setup({
	bind = true,
	handler_opts = {
		border = "none",
	},
	hint_enable = false,
	toggle_key = "<M-x>",
})
