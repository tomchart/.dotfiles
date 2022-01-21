local trouble = require 'trouble'

trouble.setup{
    mode = 'document_diagnostics',
    -- need to define lsp signs
    use_diagnostic_signs = false
}
