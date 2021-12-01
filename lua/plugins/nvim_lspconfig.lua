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
       },
      },
    },
  }

lspconfig.bashls.setup{}
lspconfig.dockerls.setup{}
lspconfig.html.setup{}

lspconfig.sqlls.setup{
        cmd = {"sql-language-server", "up", "--method", "stdio", "--debug"},
        -- args = {"up", "--method", "stdio"},
        filetypes = {"sql", "mysql"},
        root_dir = function(fname)
                return fn.getcwd()
        end,
}
