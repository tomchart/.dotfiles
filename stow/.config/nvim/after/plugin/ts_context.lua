require("treesitter-context").setup({
  enable = true,        -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 3,        -- How many lines the window should span. Values <= 0 mean no limit.
  trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  patterns = {          -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    default = {
      "class",
      "function",
      "method",
      "for",
      "while",
      "if",
      "switch",
      "case",
    },
    rust = {
      "impl_item",
      "struct",
      "enum",
    },
    markdown = {
      "section",
    },
    json = {
      "pair",
    },
    yaml = {
      "block_mapping_pair",
    },
  },
})
