vim.cmd('set completeopt=menu,menuone,noselect')

local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

vim.o.shortmess = vim.o.shortmess .. "c"

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "cmdline" },
    { name = "nvim_lsp_signature_help" },
  },
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
  enabled = function()
    if
      require"cmp.config.context".in_treesitter_capture("comment")==true
      or require"cmp.config.context".in_syntax_group("Comment")
      or vim.bo.buftype == 'prompt'
    then
      return false
    else
      return true
    end
  end,
	formatting = {
    fields = {"abbr", "kind", "menu"},
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format(
        {
          mode = "text",
          maxwidth = 25,
          menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[SNIP]",
            buffer = "[BUF]",
            path = "[PATH]",
            nvim_lua = "[LUA]",
            cmdline = "[CMD]",
          }),
          symbol_map = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
          },
      }
      )(entry, vim_item)
      return kind
		end,
	},
	mapping = {
		["<c-space>"] = cmp.mapping.complete(),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.close()
			else
				fallback()
			end
		end,
		["<cr>"] = cmp.mapping.confirm({ select = true }),
		["<c-d>"] = cmp.mapping.select_next_item({ select = false }),
		["<c-u>"] = cmp.mapping.select_prev_item({ select = false }),

	},
  sorting = {
    comparators = {
      cmp.config.compare.sort_text,
      cmp.config.compare.score,
    },
  },
	confirmation = {
		default_behavior = cmp.ConfirmBehavior.Replace,
	},
})
