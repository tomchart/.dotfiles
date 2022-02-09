local telescope = require 'telescope'
local layout = require 'telescope.actions.layout'
local actions = require 'telescope.actions'
local builtin = require 'telescope.builtin'

local M = {}

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<c-h>'] = layout.toggle_preview,
      },
      n = {
        ['<c-h>'] = layout.toggle_preview,
      },
      i = {
        ['<c-s>'] = actions.select_vertical,
      },
      n = {
        ['<c-s>'] = actions.select_vertical,
      },
    },
    sorting_strategy = 'ascending',
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
    prompt_prefix = ' 🔍  ',
    selection_caret = '  ',
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
            local displayer = entry_display.create {
                separator = ' ',
                items = {
                    { remaining = true },
                    { remaining = true },
                },
            }

            local make_display = function(entry)
                local head, tail = split_path(entry.filename)
                return displayer {
                    tail,
                    { head, 'TelescopeResultsLineNr' },
                }
            end

            return {
                valid = true,
                value = entry,
                ordinal = entry.filename .. ' ' .. entry.text,
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
}

-- create custom find_files to include dotfiles but not gitfiles
-- TODO - convert all used telescope commands in mappings.lua to custom funcs like this
M.find_files = function()
    builtin.find_files {
        find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }
    }
end

return M
