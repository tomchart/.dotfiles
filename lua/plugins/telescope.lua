local telescope = require 'telescope'
local layout = require 'telescope.actions.layout'
local actions = require 'telescope.actions'

-- TODO - some theming
telescope.setup {
  defaults = {
    layout_config = {
      horizontal = {
        width = 0.9,
        prompt_position = 'top',
        preview_width = 0.5,
      },
      vertical = { width = 0.9 },
    },
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
    prompt_prefix = ' 🔍  ',
    selection_caret = '  ',
  },
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
