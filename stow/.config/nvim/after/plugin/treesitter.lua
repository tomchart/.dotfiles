local context = require("treesitter-context")
local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = {
    "php",
    "phpdoc",
    "lua",
    "html",
    "sql",
    "query",
    "bash",
    "comment",
    "git_rebase",
    "gitcommit",
    "javascript",
    "json",
    "markdown",
    "yaml",
    "markdown_inline",
    "vim",
    "regex",
  },
  context = {
    enable = true,
  },
  playground = {
    enable = true,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { 'BufWrite', 'CursorHold' },
  },
  highlight = {
		enable = true,
		use_languagetree = true,
		disable = { "yaml", "html" },
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "grn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = false,
		disable = { "yaml", "python" },
	},
  -- need support for phtml i think
  autotag = {
    enable = true,
    enable_close = true,
    enable_rename = true,
    filetypes = {
      "php",
      "html",
      "javascript",
      "phtml",
      "markdown"
    },
  },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ia"] = "@parameter.inner",
				["aa"] = "@parameter.outer",
				["ic"] = "@call.inner",
				["ac"] = "@call.outer",
				["iC"] = "@class.inner",
				["aC"] = "@class.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
				["[a"] = "@parameter.inner",
			},
			goto_next_end = {
				["[F"] = "@function.outer",
				["[C"] = "@class.outer",
			},
			goto_previous_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
				["]a"] = "@parameter.inner",
			},
			goto_previous_end = {
				["]F"] = "@function.outer",
				["]C"] = "@class.outer",
			},
		},
	},
})


context.setup()
