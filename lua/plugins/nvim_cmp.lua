local cmp = require 'cmp'
local lspkind = require 'lspkind'
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local highlight = vim.highlight
local fn = vim.fn
local lsp = vim.lsp

cmp.setup {
        formatting = {
                format = lspkind.cmp_format({with_text = false, maxwidth = 50})
        },
        sources = {
                {name = 'nvim_lsp'},
                {name = 'vsnip'}
        },
        snippet = {
                expand = function(args)
                        fn['vsnip#anonymous'](args.body)
                end,
        },
         mapping = {
                ['<c-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(lsp.protocol.make_client_capabilities())

require('lspconfig')[''].setup {
    capabilities = capabilities
  }
