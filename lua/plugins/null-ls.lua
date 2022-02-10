local null_ls = require 'null-ls'

local sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.flake8.with({
        extra_args = { "--max-line-length", "90"}
    }),
    null_ls.builtins.diagnostics.mypy,
    }

-- TODO - fix the fucking annoying global bug

null_ls.setup {
    sources = sources,
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
        end
    end,
}
