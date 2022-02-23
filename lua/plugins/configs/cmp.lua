local present, cmp = pcall(require, "cmp")

-- local lspkind = require("lspkind")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

if not present then
    return
end

-- this whole lua file is stolen from marcus p much
-- shoutout the real og one time

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

cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	}, {
		{ name = "buffer" },
	}),
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	confirmation = {
		default_behavior = cmp.ConfirmBehavior.Replace,
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
	},
	formatting = {
		-- format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
	},
	experimental = {
		ghost_text = true,
	},
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
