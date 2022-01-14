local lspconfig = require'lspconfig'
local fn = vim.fn

lspconfig.pyright.setup{
  flags = {
    debounce_text_changes = 150,
  },
  root_dir = function(fname)
    return fn.getcwd()
  end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        pythonPath = "/usr/bin/python",
        extraPaths = {
                "/home/tom/.local/lib/python3.7/site-packages",
                "/usr/local/lib/python3.7/site-packages",
                                }
       },
      },
    },
  }

lspconfig.bashls.setup{
    cmd = { "bash-language-server", "start" },
    cmd_env = {
      GLOB_PATTERN = "*@(.sh|.inc|.bash|.command|.zsh|.zshrc)"
    },
    filetypes = { "sh", "zsh", "zshrc" },
    single_file_support = true
}
lspconfig.dockerls.setup{}
lspconfig.html.setup{}

lspconfig.sqlls.setup{
        cmd = {"sql-language-server", "up", "--method", "stdio", "--debug"},
        filetypes = {"sql", "mysql"},
        root_dir = function(fname)
                return fn.getcwd()
        end,
        settings = {
                sqlLanguageServer = {
                        connections = {
                                name = "sql-language-server",
                                adapter = "mysql",
                                host = "172.23.128.1",
                                port = 13337,
                                user = "wsl",
                                password = "${env:DB_PASSWORD}",
                                database = "debtrecovery",
                                projectPaths = {"/home/tom/New-Workflow-Processes", "/home/tom/reventus", "/home/tom/contactme"},
                        }
                }
        }
}

local sumneko_root_path = '/opt/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/' .. '/lua-language-server'
local runtime_path = vim.split(package.path, ';')

lspconfig.sumneko_lua.setup {
    cmd = {sumneko_binary};
    settings = {
        Lua = {
        runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
        },
        },
    },
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
