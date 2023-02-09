local telescope = require("telescope")
local transform_mod = require('telescope.actions.mt').transform_mod
local state = require('telescope.actions.state')
local bg = require("core.utils").bg
local fg_bg = require("core.utils").fg_bg
local x = require("core.utils").extract_highlight_colours

local layout = require("telescope.actions.layout")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local utils = require("telescope.utils")
local entry_display = require("telescope.pickers.entry_display")
telescope.load_extension('harpoon')

local gruvMedBg = '#282828'
local gruvHardBg = '#1d2021'
local gruvSoftBg = '#32302f'

-- local tele = {
--   light = x('GruvboxBg2').guifg,
--   fg = x('GruvboxFg0').guifg,
--   bg = gruvSoftBg,
--   -- bg = gruvMedBg,
--   red = x('GruvboxRed').guifg,
--   green = x('GruvboxGreen').guifg
-- }
--
-- bg("TelescopeSelection", tele.light)
-- fg_bg("TelescopeNormal", tele.fg, tele.bg)
-- fg_bg("TelescopeBorder", tele.bg, tele.bg)
-- bg("TelescopePromptNormal", tele.light)
-- fg_bg("TelescopePromptBorder", tele.light, tele.light)
-- fg_bg("TelescopePreviewBorder", tele.bg, tele.bg)
-- fg_bg("TelescopePromptTitle", tele.bg, tele.red)
-- fg_bg("TelescopePreviewTitle", tele.bg, tele.green)
-- fg_bg("TelescopeResultsTitle", tele.bg, tele.bg)

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
	local path_without_home_oms, replacements4 = path:gsub("/opt/lampp/htdocs/", "")
	if replacements4 == 1 then
    return path_without_home_oms
	end
end

local custom_actions = transform_mod({
  open_first_qf_item = function(_)
    vim.cmd.cfirst()
  end,
  grep_in_files = function(prompt_bufnr)
    local picker = state.get_current_picker(prompt_bufnr)
    local selections = picker:get_multi_selection()
    local filenames = {}
    if #selections > 0 then
      for _, entry in pairs(selections) do
        table.insert(filenames, entry[1])
      end
    else
      for entry in picker.manager:iter() do
        table.insert(filenames, entry[1])
      end
    end
    actions.close(prompt_bufnr)
    builtin.live_grep({ search_dirs = filenames })
  end,
})

telescope.setup({
  defaults = {
    border = true,
    borderchars = {" ", " ", " ", " ", " ", " ", " ", " "},
    mappings = {
      i = {
        ["<c-s>"] = actions.select_vertical,
        ["<c-h>"] = layout.toggle_preview,
        ["<c-c>"] = actions.close,
        ["<c-w>"] = actions.delete_buffer,
      },
      n = {
        ["<c-s>"] = actions.select_vertical,
        ["<c-h>"] = layout.toggle_preview,
        ["<c-c>"] = actions.close,
        ["dd"] = actions.delete_buffer,
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
    prompt_prefix = "   ",
    selection_caret = "  ",
  },
  pickers = {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix', '--follow', '--hidden', '--exclude', '.git' },
      mappings = {
        i = {
          ['<c-g>'] = custom_actions.grep_in_files,
        },
        n = {
          ['<c-g>'] = custom_actions.grep_in_files,
        },
      },
    },
    oldfiles = {
      path_display = function(opts, path)
        return shorten_path(path)
      end,
    },
  },
  winblend = 0,
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

vim.keymap.set("n", "<c-p>", builtin.find_files)
vim.keymap.set("n", "<c-b>", builtin.buffers)
vim.keymap.set("n", "<c-f>", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<c-g>", builtin.live_grep)
vim.keymap.set("n", "<c-o>", builtin.oldfiles)
vim.keymap.set("n", "<c-s>", builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader>gc", builtin.git_commits)
vim.keymap.set("n", "<leader>s", builtin.git_status)
vim.keymap.set("n", "<leader>bc", builtin.git_bcommits)
vim.keymap.set("n", "<leader>gb", builtin.git_branches)
vim.keymap.set("n", "<leader>ht", builtin.help_tags)
vim.keymap.set("n", "<leader>r", builtin.resume)
vim.keymap.set("n", "<leader>d", builtin.lsp_definitions)
vim.keymap.set("n", "<leader>w", builtin.diagnostics)
vim.keymap.set("n", "<leader>hl", builtin.highlights)
