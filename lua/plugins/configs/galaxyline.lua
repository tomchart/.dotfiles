local present, galaxyline = pcall(require, "galaxyline")
if not present then
	return
end

local present, condition = pcall(require, "galaxyline.condition")
if not condition then
	return
end

local fn = vim.fn
local diag = vim.diagnostic
local hi = require("core.utils").hi

galaxyline.short_line_list = { "NvimTree", "term", "dashboard" }

local round = {
  left = "",
  right = "",
	main_icon = "  ",
	vi_mode_icon = " ",
	position_icon = " "
}

local slant = {
	left = " ",
	right = " ",
	main_icon = "  ",
	vi_mode_icon = " ",
	position_icon = " ",
}

local style = round

local mode_symbol_to_mode = {
	n = "NORMAL",
	i = "INSERT",
	c = "COMMAND",
	v = "VISUAL",
	V = "VISUAL LINE",
	[""] = "VISUAL BLOCK",
	R = "REPLACE",
	s = "SNIPPET",
}

local function get_diag_count(severity_level)
	local count = 0
	local diag = vim.diagnostic.get(0, { severity = severity_level })
	for _ in pairs(diag) do
		count = count + 1
	end
	if count == nil then
		return 0
	else
		return count
	end
end

galaxyline.section.left = {
	{
		ViSymbol = {
			provider = function()
				local mode = mode_symbol_to_mode[fn.mode()]
        hi("GalaxylineMode", "Galaxyline" .. mode:gsub(" ", "") .. "Mode")
        hi("GalaxylineModeSeparator", "Galaxyline" .. mode:gsub(" ", "") .. "ModeSeparator")
        hi("GalaxylineModeSeparator2", "Galaxyline" .. mode:gsub(" ", "") .. "ModeSeparator2")
				return "    "
			end,
			highlight = "GalaxylineMode",
			separator = style.right,
			separator_highlight = "GalaxylineModeSeparator",
		},
	},
	{
		-- grey separator
		Sep = {
			provider = function()
				return style.right
			end,
			highlight = "GalaxylineSeparator10",
		},
	},
	{
		ViMode = {
			provider = function()
				local mode = mode_symbol_to_mode[fn.mode()]
        hi("GalaxylineModeText", "Galaxyline" .. mode:gsub(" ", "") .. "ModeText")
				return "  " .. mode
			end,
			highlight = "GalaxylineModeText",
			separator = style.right,
			separator_highlight = "GalaxylineSeparator6",
		},
	},
	{
		-- this is a space
		Sep2 = {
			provider = function()
				return style.right
			end,
			highlight = "GalaxylineSeparator13",
		},
	},
	{
		CurrentDir = {
			provider = function()
				local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				return "   " .. dir_name .. " "
			end,
			highlight = "GalaxylineDir",
      separator = style.right,
      separator_highlight = "GalaxylineSeparator15"
		},
	},
	{
    -- this is a space
		Sep3 = {
			provider = function()
				return style.right
			end,
			highlight = "GalaxylineSeparator16",
		},
	},
	{
		FileIcon = {
			provider = "FileIcon",
			condition = condition.buffer_not_empty,
			highlight = {
				require("galaxyline.providers.fileinfo").get_file_icon_color,
				"#272730", -- palette.one_bg
			},
		},
	},
	{
		FileName = {
			provider = "FileName",
			condition = condition.buffer_not_empty,
			separator = style.right,
			highlight = "GalaxylineFilename",
			separator_highlight = "GalaxylineSeparator3",
		},
	},
	{
		GitIcon = {
			provider = function()
				return "  "
			end,
			condition = condition.check_git_workspace,
			highlight = "GalaxylineIcon",
		},
	},
	{
		GitBranch = {
			provider = "GitBranch",
			condition = condition.check_git_workspace,
			highlight = "GalaxylineBranch",
			separator = " ",
			separator_highlight = "GalaxylineBranch",
		},
	},
	{
		DiffAdd = {
			provider = "DiffAdd",
			condition = condition.check_git_workspace,
			icon = "  ",
			highlight = "GalaxylineDiffAdd",
		},
	},
	{
		DiffModified = {
			provider = "DiffModified",
			condition = condition.check_git_workspace,
			icon = "  ",
			highlight = "GalaxylineDiffModified",
		},
	},
	{
		DiffRemove = {
			provider = "DiffRemove",
			condition = condition.check_git_workspace,
			icon = "  ",
			highlight = "GalaxylineDiffRemove",
		},
	},
	{
		Space = {
			provider = function()
				return " "
			end,
			condition = condition.check_git_workspace,
		},
	},
}

galaxyline.section.mid = {
	{
		Middle = {
			provider = function()
				return ""
			end,
			highlight = "GalaxylineMid",
		},
	},
}

galaxyline.section.right = {
	{
		DiagnosticHint = {
			provider = function()
				return get_diag_count(diag.severity.HINT)
			end,
			condition = function()
				if get_diag_count(diag.severity.HINT) > 0 then
					return true
				end
			end,
			highlight = "GalaxylineHint",
			icon = "  ",
		},
	},
	{
		DiagnosticWarn = {
			provider = function()
				return get_diag_count(diag.severity.WARN)
			end,
			condition = function()
				if get_diag_count(diag.severity.WARN) > 0 then
					return true
				end
			end,
			highlight = "GalaxylineWarn",
			icon = "   ",
		},
	},
	{
		DiagnosticError = {
			provider = function()
				return get_diag_count(diag.severity.ERROR)
			end,
			condition = function()
				if get_diag_count(diag.severity.ERROR) > 0 then
					return true
				end
			end,
			highlight = "GalaxylineError",
			icon = "   ",
		},
	},
	{
		GetLspClient = {
			provider = function()
				if next(vim.lsp.buf_get_clients()) ~= nil then
					return "     LSP "
				else
					return ""
				end
			end,
			highlight = "GalaxylineLsp",
		},
	},
	{
		Sep4 = {
			provider = function()
				return style.left
			end,
			highlight = "GalaxylineSeparator12",
		},
	},
	{
		Sep6 = {
			provider = function()
				return style.left
			end,
			highlight = "GalaxylineSeparator11",
		},
	},
	{
		LineInfo = {
			provider = "LineColumn",
			highlight = "GalaxylineLineInfo",
		},
	},
	{
		Sep7 = {
			provider = function()
				return style.left
			end,
			highlight = "GalaxylineSeparator14",
		},
	},
	{
		Sep8 = {
			provider = function()
				return style.left
			end,
			highlight = "GalaxylineModeSeparator",
		},
	},
	{
		LineInfoIcon = {
			provider = function()
				return "   "
			end,
			highlight = "GalaxylineMode",
		},
	},
	{
		PerCent = {
			provider = "LinePercent",
			highlight = "GalaxylinePercent",
			separator = style.left,
			separator_highlight = "GalaxylineSeparator6",
		},
	},
	{
		Sep9 = {
			provider = function()
				return style.left
			end,
			highlight = "GalaxylineSeparator10",
		},
	},
	{
		PerCentIcon = {
			-- provider = "LinePercent",
			provider = function()
				return " "
			end,
			highlight = "GalaxylineMode",
			separator = style.left,
			separator_highlight = "GalaxylineModeSeparator",
		},
	},
}
