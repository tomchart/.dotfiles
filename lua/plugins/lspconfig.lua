local lspconfig = require 'lspconfig'
local fn = vim.fn

local servers = {
    pyright = {
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
    },
    bashls = {
        cmd = { "bash-language-server", "start" },
        cmd_env = {
          GLOB_PATTERN = "*@(.sh|.inc|.bash|.command|.zsh|.zshrc)"
            },
        filetypes = { "sh", "zsh", "zshrc" },
        single_file_support = true
    },
    dockerls = {},
    html = {},
    sqlls = {
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
}

local sumneko_root_path = '/opt/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/macOS/lua-language-server'
local runtime_path = vim.split(package.path, ';')

lspconfig.sumneko_lua.setup {
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua'};
    settings = {
        Lua = {
        runtime = {
            version = 'LuaJIT',
            path = runtime_path,
        },
        diagnostics = {
            globals = {'vim'},
        },
        workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
            enable = false,
        },
        },
    },
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for server, config in pairs(servers) do
    lspconfig[server].setup {
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        settings = config.settings,
        root_dir = config.root_dir,
        cmd = config.cmd,
    }
end

vim.diagnostic.config {
    virtual_text = false,
    float = {
        source = 'always'
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
}
