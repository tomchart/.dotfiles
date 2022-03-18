local present, telescope = pcall(require, "telescope")

if not present then
	return
end

local layout = require("telescope.actions.layout")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local utils = require("telescope.utils")
local entry_display = require("telescope.pickers.entry_display")

--- Splits a filepath into head / tail where tail is the last path component and
--- head is everything before it.
---@param path string
---@return string head
---@return string tail
local function split_path(path)
	local tail = utils.path_tail(path)
	local head = path:gsub("/" .. tail .. "$", "")
	return head, tail
end

--- Shortens the given path by either:
--- - making it relative if it's part of the cwd
--- - replacing the home directory with ~ if not
---@param path string
---@return string
local function shorten_path(path)
	local cwd = vim.fn.getcwd()
	if path == cwd then
		return ""
	end
	local relative_path, replacements = path:gsub("^" .. cwd .. "/", "")
	if replacements == 1 then
		return relative_path
	end
	local path_without_home, replacements2 = path:gsub("^" .. os.getenv("HOME"), "~")
	if replacements2 == 1 then
		return path_without_home
	end
	local path_without_home_win, replacements3 = path:gsub("/mnt/c/Users/tom", "win/~")
	if replacements3 == 1 then
		return path_without_home_win
	end
end

local M = {}

M.setup = function()
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<c-s>"] = actions.select_vertical,
					["<c-h>"] = layout.toggle_preview,
					["<c-c>"] = actions.close,
				},
				n = {
					["<c-s>"] = actions.select_vertical,
					["<c-h>"] = layout.toggle_preview,
					["<c-c>"] = actions.close,
				},
			},
			file_ignore_patterns = { ".git/" },
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = false,
				},
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
			prompt_prefix = " 🔍  ",
			selection_caret = "  ",
		},
		pickers = {
			oldfiles = {
				path_display = function(opts, path)
					return shorten_path(path)
				end,
			},
		},
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		lsp_definitions = {
			-- copied and modified from make_entry.gen_from_quickfix
			entry_maker = function(entry)
				local displayer = entry_display.create({
					separator = " ",
					items = {
						{ remaining = true },
						{ remaining = true },
					},
				})

				local make_display = function(entry)
					local head, tail = split_path(entry.filename)
					return displayer({
						tail,
						{ head, "TelescopeResultsLineNr" },
					})
				end

				return {
					valid = true,
					value = entry,
					ordinal = entry.filename .. " " .. entry.text,
					display = make_display,
					bufnr = entry.bufnr,
					filename = entry.filename,
					lnum = entry.lnum,
					col = entry.col,
					text = entry.text,
					start = entry.start,
					finish = entry.finish,
				}
			end,
		},
	})
end

-- create custom find_files to include dotfiles but not gitfiles
-- TODO - convert all used telescope commands in mappings.lua to custom funcs like this
M.find_files = function()
	builtin.find_files({
		find_command = { "rg", "--files" },
		path_display = function(opts, path)
			return shorten_path(path)
		end,
	})
end

return M
