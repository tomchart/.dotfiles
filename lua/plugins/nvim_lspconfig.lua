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

lspconfig.sqlls.setup{}
