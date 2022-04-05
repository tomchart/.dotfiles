local present, lspconfig = pcall(require, "lspconfig")
if not present then
	return
end

local fn = vim.fn

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/core/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Don't add ~/.config/nvim to the LSP libraries because that's just a symlink
-- to ~/.dotfiles/nvim/lua, so when we're in ~/.dotfiles/nvim/lua we end up
-- with duplicate symbols
-- (stolen from marcus)
local runtime_files = vim.api.nvim_get_runtime_file("", true)
local config_dir = fn.expand("~/.config/nvim")
local lua_library = {}
for _, file in ipairs(runtime_files) do
	if file:sub(1, #config_dir) ~= config_dir then
		table.insert(lua_library, file)
	end
end

lspconfig.sumneko_lua.setup({
	cmd = {
		"/opt/lua-language-server/bin/macOS/lua-language-server",
		"-E",
		"/opt/lua-language-server/main.lua",
	},
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				globals = { "vim" },
				disable = { "lowercase-global" },
			},
			workspace = {
				library = lua_library,
			},
		},
	},
})

local servers = {
	pyright = {
		root_dir = function(fname)
			return fn.getcwd()
		end,
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					autoImportCompletions = false,
					diagnosticMode = "workspace",
					useLibraryCodeForTypes = true,
					pythonPath = "/usr/bin/python",
					extraPaths = {
						"/home/tom/.local/lib/python3.7/site-packages",
						"/usr/local/lib/python3.7/site-packages",
						"/home/tom/.pyenv/versions/rev3910/lib/python3.9/site-packages",
					},
				},
			},
		},
	},
	bashls = {
		cmd = { "bash-language-server", "start" },
		cmd_env = {
			GLOB_PATTERN = "*@(.sh|.inc|.bash|.command|.zsh|.zshrc)",
		},
		filetypes = { "sh", "zsh", "zshrc" },
		single_file_support = true,
	},
	remark_ls = {
		cmd = { "remark-language-server", "--stdio" },
		filetypes = { "markdown" },
	},
	dockerls = {},
	html = {},
    cssls = {},
    intelephense = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}
for server, config in pairs(servers) do
	lspconfig[server].setup({
		on_attach = function(client)
			require("illuminate").on_attach(client)
		end,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
		settings = config.settings,
		root_dir = config.root_dir,
		cmd = config.cmd,
	})
end

vim.diagnostic.config({
	virtual_text = false,
	float = {
		source = "always",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
