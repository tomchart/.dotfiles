local present, galaxyline = pcall(require, "galaxyline")
if not present then
	return
end

local present, condition = pcall(require, "galaxyline.condition")
if not condition then
	return
end

local present, gps = pcall(require, "nvim-gps")
if not present then
	return
end

local fn = vim.fn
local diag = vim.diagnostic
local highlight = vim.highlight

galaxyline.short_line_list = { "NvimTree", "term", "dashboard" }

local slant = {
	left = " ",
	right = " ",
	main_icon = "  ",
	vi_mode_icon = " ",
	position_icon = " ",
}

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
				highlight.link("GalaxylineMode", "Galaxyline" .. mode:gsub(" ", "") .. "Mode", true)
				highlight.link("GalaxylineModeSeparator", "Galaxyline" .. mode:gsub(" ", "") .. "ModeSeparator", true)
				return "    "
			end,
			highlight = "GalaxylineMode",
			separator = " ",
			separator_highlight = "GalaxylineModeSeparator",
		},
	},
    {
        -- this is a space
		Sep = {
			provider = function()
				return " "
			end,
			highlight = "GalaxylineSeparator10",
		},
	},
	{
		ViMode = {
			provider = function()
				local mode = mode_symbol_to_mode[fn.mode()]
				highlight.link("GalaxylineModeText", "Galaxyline" .. mode:gsub(" ", "") .. "ModeText", true)
				return "  " .. mode
			end,
			highlight = "GalaxylineModeText",
			separator = " ",
			separator_highlight = "GalaxylineSeparator6",
		},
	},
	{
        -- this is a space
		Sep2 = {
			provider = function()
				return " "
			end,
			highlight = "GalaxylineSeparator2",
		},
	},
	{
		CurrentDir = {
			provider = function()
				local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				return "  " .. dir_name .. " "
			end,
			highlight = "GalaxylineDir",
		},
	},
	{
		Sep3 = {
			provider = function()
				return " "
			end,
			highlight = "GalaxylineSeparator5",
		},
	},
	{
		FileIcon = {
			provider = "FileIcon",
			condition = condition.buffer_not_empty,
			highlight = {
				require("galaxyline.providers.fileinfo").get_file_icon_color,
				"#3a3c4e",
			},
		},
	},
	{
		FileName = {
			provider = "FileName",
			condition = condition.buffer_not_empty,
			separator = " ",
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
			icon = " ",
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
	-- {
	-- 	nvimGPS = {
	-- 		provider = function()
	-- 			return gps.get_location()
	-- 		end,
	-- 		condition = function()
	-- 			return gps.is_available()
	-- 		end,
	-- 	},
	-- },
}

galaxyline.section.right = {
	{
		GetLspClient = {
			provider = "GetLspClient",
			highlight = "GalaxylineLsp",
			separator = " ",
			separator_highlight = "GalaxylineSeparator9",
		},
	},
	{
		Sep4 = {
			provider = function()
				return " "
			end,
			highlight = "GalaxylineSeparator8",
		},
	},
	{
		DiagnosticHint = {
			provider = function()
				return get_diag_count(diag.severity.HINT)
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
			highlight = "GalaxylineWarn",
			icon = "   ",
		},
	},
	{
		DiagnosticError = {
			provider = function()
				return get_diag_count(diag.severity.ERROR)
			end,
			highlight = "GalaxylineError",
			icon = "   ",
		},
	},
    {
		Sep5 = {
			provider = function()
				return " "
			end,
			highlight = "GalaxylineSeparator2",
		},
	},
    {
		Sep6 = {
			provider = function()
				return " "
			end,
			highlight = "GalaxylineSeparator6",
		},
	},
	{
		LineInfo = {
			provider = "LineColumn",
            highlight = "GalaxylineModeText",
		},
	},
    {
		Sep7 = {
			provider = function()
				return " "
			end,
			highlight = "GalaxylineSeparator10",
		},
	},
	{
		PerCent = {
			provider = "LinePercent",
			highlight = "GalaxylineMode",
			separator = " ",
			separator_highlight = "GalaxylineModeSeparator",
		},
	},
}
