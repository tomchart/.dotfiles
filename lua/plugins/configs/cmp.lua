local present, cmp = pcall(require, "cmp")

if not present then
	return
end

local icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

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
		num_preceding_quotes = select(2, preceding_chars:gsub(next_char, ""))
		-- if odd number of preceding quotes, then we're currently inside a pair
		return num_preceding_quotes % 2 == 1
	end
	return brackets[next_char] == true
end

local conf = {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

			vim_item.menu = ({
				nvim_lsp = "[LSP]",
        luasnip = "[SNIP]",
				buffer = "[BUF]",
        path = "[PATH]",
        nvim_lua = "[LUA]",
        cmdline = "[CMD]",
			})[entry.source.name]

			return vim_item
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
	confirmation = {
		default_behavior = cmp.ConfirmBehavior.Replace,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim_lua" },
		{ name = "cmdline" },
	},
	experimental = {
		ghost_text = { hl_group = "DraculaPurple" },
	},
}
-- cmp.event:on("confirm_done", require("nvim-autopairs").completion.cmp.on_confirm_done())

local M = {}
M.setup = function()
	cmp.setup(conf)
end

return M
