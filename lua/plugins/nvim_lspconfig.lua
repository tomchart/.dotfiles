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
                                }
       },
      },
    },
  }

lspconfig.bashls.setup{}
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
