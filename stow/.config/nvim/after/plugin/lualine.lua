local mocha = require("catppuccin.palettes").get_palette "mocha"

local function lsp_ready()
  if vim.lsp.buf.server_ready() == true then
    return "LSP";
  else
    return "...";
  end
end

require("lualine").setup({
	sections = {
		lualine_a = {
			{
				"mode",
				icon = { "" },
        fmt = function (mode, _)
          return " " .. mode
        end
			},
		},
		lualine_b = {
      {
        "filetype",
        icon_only = true,
        icon = {
          align = "right"
        }
      },
			{
				"filename",
        path = 0,
        symbols = {
          modified = '',
          readonly = '[-]',
          unnamed = '[no name]',
          newfile = '[new]',
        },
			},
		},
		lualine_c = {
			{
				"branch",
        color = {
          fg = mocha.peach,
        },
				icon = {
					"",
				},
			},
			{
				"diff",
				colored = true,
				symbols = {
					added = "  ",
					modified = "  ",
					removed = "  ",
					-- added = "  ",
					-- modified = " 󰝤",
					-- removed = "  ",
				},
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = {
					error = "  ",
					warn = "  ",
					info = "  ",
					hint = "  ",
				},
			},
		},
		lualine_y = {
			{
				lsp_ready,
				icon = {
					"",
					align = "left",
					color = {
						gui = "bold",
					},
				},
			},
		},
		lualine_z = {
			{
				"location",
        icon = {
					" ",
          align = "left",
        },
			},
			{
				"progress",
				icon = {
          " ",
					align = "left",
				},
			},
		},
	},
	options = {
		disabled_filetypes = { "dashboard" },
		globalstatus = true,
		-- section_separators = { left = "", right = "" },
		-- section_separators = { left = "█", right = "█" },
		-- section_separators = { left = " ", right = " " },
		section_separators = { left = " ", right = " " },
		component_separators = { left = "", right = "" },
    theme = 'catppuccin',
	},
})
