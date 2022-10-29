local present, lspconfig = pcall(require, "lspconfig")
if not present then
	return
end

local fn = vim.fn

local servers = {
	sumneko_lua = {
	settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = {
          enable = false,
        },
        completion = {
          keywordSnippet = 'Disable',
        },
      },
    },
    },
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
  cssls = {},
  intelephense = {},
  vuels = {},
  emmet_ls = {
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'jsx', 'php' },
  },
  -- tailwindcss = {},
  -- eslint = {},
  tsserver = {
    single_file_support = true,
    preferences = {
    quotePreference = "double",
  },
  },

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
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
		settings = config.settings,
		root_dir = config.root_dir,
		cmd = config.cmd,
	})
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
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
