local luasnip = require("luasnip")
luasnip.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI"
})
luasnip.filetype_extend("javascript", { "javascriptreact" })
luasnip.filetype_extend("javascript", { "html" })
require("luasnip/loaders/from_vscode").lazy_load()
