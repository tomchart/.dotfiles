local signature = require("lsp_signature")

signature.setup({
  bind = true,
  handler_opts = {
    border = "none",
  },
  hint_enable = false,
  toggle_key = "<M-x>",
})
