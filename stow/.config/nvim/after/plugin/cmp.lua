vim.cmd('set completeopt=menu,menuone,noselect')

local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

vim.o.shortmess = vim.o.shortmess .. "c"

local function replace_termcodes(s)
	return vim.api.nvim_replace_termcodes(s, false, false, true)
end

local function feedkeys(keys, mode)
	vim.api.nvim_feedkeys(replace_termcodes(keys), mode, true)
end

-- Check if we should tab out of a pair of brackets / quotes. Returns true if
-- the next character is a:
-- - closing bracket
-- - quote and we're inside a pair of them
local function should_tab_out()
	local brackets = {
		[")"] = true,
		["]"] = true,
		["}"] = true,
	}
	local quotes = {
		["'"] = true,
		['"'] = true,
		["`"] = true,
	}

	local line = vim.fn.getline(".")
	local col = vim.fn.col(".")
	local next_char = line:sub(col, col)

	if quotes[next_char] then
		local preceding_chars = line:sub(1, col - 1)
		local num_preceding_quotes = select(2, preceding_chars:gsub(next_char, ""))
		-- if odd number of preceding quotes, then we're currently inside a pair
		return num_preceding_quotes % 2 == 1
	end
	return brackets[next_char] == true
end

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "cmdline" },
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
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
      scrollbar = false
    },
    documentation = {
      winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
    }
  },
	formatting = {
    fields = {"abbr", "kind", "menu"},
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format(
        {
          mode = "symbol_text",
          maxwidth = 25,
          menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[SNIP]",
            buffer = "[BUF]",
            path = "[PATH]",
            nvim_lua = "[LUA]",
            cmdline = "[CMD]",
          }),
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
			elseif should_tab_out() then
				feedkeys("<right>", "i")
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

vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', {link = '@comment'})

vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', {link = 'TelescopeMatching'})
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', {link = 'CmpItemAbbrMatch'})

vim.api.nvim_set_hl(0, 'CmpItemKindVariable', {link = '@variable'})
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', {link = 'CmpItemKindVariable'})

vim.api.nvim_set_hl(0, 'CmpItemKindText', {link = '@comment'})

vim.api.nvim_set_hl(0, 'CmpItemKindFunction', {link = '@function'})
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', {link = 'CmpItemKindFunction'})

vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', {link = '@keyword'})
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', {link = 'CmpItemKindKeyword'})

vim.api.nvim_set_hl(0, 'CmpItemKindProperty', {link = '@property'})

vim.api.nvim_set_hl(0, 'CmpItemKindField', {link = '@field'})

vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', {link = '@constructor'})

vim.api.nvim_set_hl(0, 'CmpItemKindClass', {link = '@class'})

vim.api.nvim_set_hl(0, 'CmpItemKindConstant', {link = '@constant'})

vim.api.nvim_set_hl(0, 'CmpItemKindFile', {link = '@include'})
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', {link = 'CmpItemKindFile'})
