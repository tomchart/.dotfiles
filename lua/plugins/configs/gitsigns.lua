local present, gitsigns = pcall(require, "gitsigns")
if not present then
	return
end

local M = {}

M.setup = function()
	gitsigns.setup({
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "<leader>hj", "&diff ? '<leader>hj' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
			map("n", "<leader>hk", "&diff ? '<leader>hk' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

			-- Actions
			map({ "n", "v" }, "<leader>hs", gs.stage_hunk)
			map({ "n", "v" }, "<leader>hr", gs.reset_hunk)
			map("n", "<leader>hS", gs.stage_buffer)
			map("n", "<leader>hu", gs.undo_stage_hunk)
			map("n", "<leader>hR", gs.reset_buffer)
			map("n", "<leader>hp", gs.preview_hunk)
			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end)
			map("n", "<leader>tb", gs.toggle_current_line_blame)
			map("n", "<leader>hd", gs.diffthis)
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end)
			map("n", "<leader>td", gs.toggle_deleted)

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
		end,

		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "        <author>, <author_time:%Y-%m-%d> - <summary>",
	})
end

return M
