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
		"/opt/lua-language-server/bin/lua-language-server",
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
	html = {
    filetypes = { 'html', 'php' },
  },
  cssls = {
    filetypes = { 'html', 'css', 'php' }
  },
  jsonls = {},
  intelephense = {},
  vuels = {},
  sqlls = {
    cmd = { "sql-language-server", "up", "--method", "stdio" }
  },
  -- emmet_ls = {
  --     filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'jsx', 'php' },
  -- },
  -- tailwindcss = {},
  -- eslint = {
		-- root_dir = function(fname)
		-- 	return fn.getcwd()
		-- end,
  -- },
  tsserver = {
    single_file_support = true,
    preferences = {
    quotePreference = "single",
    },
  },

}

local capabilities = vim.lsp.protocol.make_client_capabilities()
for server, config in pairs(servers) do
	lspconfig[server].setup({
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
    filetypes = config.filetypes,
		settings = config.settings,
		root_dir = config.root_dir,
		cmd = config.cmd,
	})
end
local signs = {
  Error = "",
  Warn = "",
  Hint = "",
  Info = "",
}
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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
