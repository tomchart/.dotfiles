-- Using Lualine as the statusline.

-- Show git status.
local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

-- Get the current buffer's type.
local function get_current_buftype()
	return vim.api.nvim_buf_get_option(0, "buftype")
end

-- Gets the current buffer's filename with the filetype icon supplied
-- by devicons.
local M = require("lualine.components.filetype"):extend()
Icon_hl_cache = {}
local lualine_require = require("lualine_require")
local modules = lualine_require.lazy_require({
	highlight = "lualine.highlight",
	utils = "lualine.utils.utils",
})

-- Return the current buffer's filetype icon with highlighting.
function M:get_current_filetype_icon()
	-- Get setup.
	local icon, icon_highlight_group
	local _, devicons = pcall(require, "nvim-web-devicons")
	local f_name, f_extension = vim.fn.expand("%:t"), vim.fn.expand("%:e")
	f_extension = f_extension ~= "" and f_extension or vim.bo.filetype
	icon, icon_highlight_group = devicons.get_icon(f_name, f_extension)

	-- Fallback settings.
	if icon == nil and icon_highlight_group == nil then
		icon = ""
		icon_highlight_group = "DevIconDefault"
	end

	-- Set colors.
	local highlight_color = modules.utils.extract_highlight_colors(icon_highlight_group, "fg")
	if highlight_color then
		local default_highlight = self:get_default_hl()
		local icon_highlight = Icon_hl_cache[highlight_color]
		if not icon_highlight or not modules.highlight.highlight_exists(icon_highlight.name .. "_normal") then
			icon_highlight = self:create_hl({ fg = highlight_color }, icon_highlight_group)
			Icon_hl_cache[highlight_color] = icon_highlight
		end
		icon = self:format_hl(icon_highlight) .. icon .. default_highlight
	end

	-- Return the formatted string.
	return icon
end

local function lsp_client_names()
  local clients = {}

  for _, client in pairs(vim.lsp.buf_get_clients(0)) do
    clients[#clients + 1] = client.name
  end

  return table.concat(clients, ' ')
end

-- Display the difference in commits between local and head.
local Job = require("plenary.job")
local function get_git_compare()
	-- Get the path of the current directory.
	local curr_dir = vim.api.nvim_buf_get_name(0):match("(.*" .. "/" .. ")")

	-- Run job to get git.
	local result = Job:new({
		command = "git",
		cwd = curr_dir,
		args = { "rev-list", "--left-right", "--count", "HEAD...@{upstream}" },
	})
		:sync(100)[1]

	-- Process the result.
	if type(result) ~= "string" then
		return ""
	end
	local ok, ahead, behind = pcall(string.match, result, "(%d+)%s*(%d+)")
	if not ok then
		return ""
	end

	-- No file, so no git.
	if get_current_buftype() == "nofile" then
		return ""
	end

	-- Format for lualine.
	return " " .. behind .. "  " .. ahead
end

-- Required to properly set the colors.
local c = require("nordic.colors")
local n = require("lualine.themes.nordic")

-- some customization
n.normal.a.bg = c.green.base
n.insert.a.bg = c.red.base
n.visual.a.bg = c.magenta.base
n.normal.y = { fg = c.fg, bg = c.black }
n.insert.y = { fg = c.fg, bg = c.black }
n.visual.y = { fg = c.fg, bg = c.black }
n.command.y = { fg = c.fg, bg = c.black }

require("lualine").setup({
	sections = {
		lualine_a = {
			{
				"mode",
				icon = { " " },
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
        path = 1,
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
				icon = {
					"",
					color = { fg = c.orange.bright, gui = "bold" },
				},
			},
			{
				get_git_compare,
				separator = " ",
				color = {
					fg = c.orange.bright,
				},
				-- icon = {
				--     ' ',
				--     color = { fg = c.orange.bright, gui = 'bold' },
				-- }
			},
			{
				"diff",
				colored = true,
				source = diff_source,
				symbols = {
					added = "  ",
					modified = " 柳",
					removed = "  ",
				},
				diff_color = {
					added = { fg = c.green.base, gui = "bold" },
					modified = { fg = c.yellow.base, gui = "bold" },
					removed = { fg = c.red.base, gui = "bold" },
				},
				-- icon = {
				--     ' ',
				--     color = { fg = c.orange.base },
				-- }
			},
		},
		lualine_x = {
      {
        "searchcount",
      },
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = {
					error = "  ",
					warn = "  ",
					info = "  ",
					hint = "  ",
				},
				diagnostics_color = {
					error = { fg = c.error, gui = "bold" },
					warn = { fg = c.warn, gui = "bold" },
					info = { fg = c.info, gui = "bold" },
					hint = { fg = c.hint, gui = "bold" },
				},
			},
		},
		lualine_y = {
			{
				lsp_client_names,
				icon = {
					"",
					align = "left",
					color = {
						fg = c.blue.bright,
						gui = "bold",
					},
				},
			},
		},
		lualine_z = {
			{
				"location",
				icon = {
					"",
					align = "left",
					color = { fg = c.black },
				},
			},
			{
				"progress",
				icon = {
					"",
					align = "left",
					color = { fg = c.black },
				},
			},
		},
	},
	options = {
		disabled_filetypes = { "dashboard" },
		globalstatus = true,
		-- section_separators = { left = "", right = "" },
		-- section_separators = { left = "█", right = "█" },
		-- section_separators = { left = "", right = " " },
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		theme = n,
	},
	extensions = {
		"toggleterm",
		"nvim-tree",
	},
})
