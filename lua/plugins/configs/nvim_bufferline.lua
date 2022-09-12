local bufferline = require("bufferline")

bufferline.setup({
	highlights = {
		fill = {
			bg = "#191922",
		},
		buffer_selected = {
			underline = false,
			undercurl = false,
			italic = true,
		},
		duplicate_selected = {
			underline = false,
			undercurl = false,
			italic = true,
		},
		indicator_selected = {
			fg = "#A3D4D5",
		},
    separator = {
      fg = "#191922",
      bg = "#1F1F28",
    },
	},
	options = {
		middle_mouse_command = function(bufnum)
			require("bufdelete").bufdelete(bufnum)
		end,
		right_mouse_command = "vertical sbuffer %d",
    indicator = {
      style = "icon",
      icon = "▎",
    },
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 10,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or " ")
				s = s .. n .. sym
			end
			return s
		end,
		always_show_bufferline = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = "thick",
		offsets = { { filetype = "NvimTree", text = "File Explorer" } },
	},
})
