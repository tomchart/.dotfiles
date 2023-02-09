local feline = require("feline")
local vi_mode_utils = require("feline.providers.vi_mode")

local icons = {
    linux = ' ',
    macos = ' ',
    windows = ' ',

    errs = ' ',
    warns = ' ',
    infos = ' ',
    hints = ' ',

    lsp = ' ',
}

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == 'UNIX' then
        icon = icons.linux
    elseif os == 'MAC' then
        icon = icons.macos
    else
        icon = icons.windows
    end
    return icon .. os
end

local function dir_info()
  local dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.:h")
  if dir == '.' then
    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h")
  else
    return dir
  end
end

-- local kanagawa = {
-- 	bg = "#1F1F28", --  nvim bg
-- 	darker_black = "#191922",
-- 	black = "#1F1F28", --  nvim bg
-- 	black2 = "#25252e",
-- 	one_bg = "#272730",
-- 	one_bg2 = "#2f2f38",
-- 	one_bg3 = "#363646",
-- 	grey = "#43434c",
-- 	grey_fg = "#4c4c55",
-- 	grey_fg2 = "#53535c",
-- 	yellow = "#FF9E3B",
-- 	cyan = "#A3D4D5",
-- 	skyblue = "#957FB8",
-- 	green = "#98BB6C",
-- 	orange = "#fa9b61",
-- 	violet = "#c8748f",
-- 	magenta = "#a48ec7",
-- 	white = "#DCD7BA",
-- 	fg = "#DCD7BA",
-- 	oceanblue = "#957FB8",
-- 	red = "#E46876",
-- 	light_grey = "#5c5c65",
-- 	line = "#272730", -- for lines like vertsplit
-- 	vibrant_green = "#a3c677",
-- 	sun = "#FFA066",
-- 	teal = "#7AA89F",
-- 	statusline_bg = "#24242d",
-- 	lightbg = "#33333c",
-- 	lightbg2 = "#2b2b34",
-- 	pmenu_bg = "#a48ec7",
-- 	folder_bg = "#7E9CD8",
-- 	baby_pink = "#D27E99",
-- 	pink = "#c8748f",
-- 	purple = "#a48ec7",
-- 	dark_purple = "#957FB8",
-- }

-- local catppuccin = {
--   bg = '#1e1e2e',
--   black = '#1e1e2e',
--   yellow = '#f9e2af',
--   cyan = '#94e2d5',
--   oceanblue = '#89b4fa',
--   green = '#a6e3a1',
--   orange = '#fab387',
--   violet = '#cba6f7',
--   magenta = '#eba0ac',
--   white = '#f5e0dc',
--   fg = '#f5e0dc',
--   skyblue = '#74c7ec',
--   red = '#f38ba8',
-- }

-- local tokyonightstorm = {
--   bg = "#24283b",
--   black = "#24283b",
--   yellow = "#e0af68",
--   cyan = "#7dcfff",
--   oceanblue = "#7aa2f7",
--   green = "#9ece6a",
--   orange = "#e0af68",
--   violet = "#bb9af7",
--   magenta = "#bb9af7",
--   white = "#c0caf5",
--   fg = "#c0caf5",
--   skyblue = "#7dcfff",
--   red = "#f7768e",
-- }

-- local oxocarbon = {
--   author = "shaunsingh/IBM",
--   base00 = "#161616",
--   base01 = "#262626",
--   base02 = "#393939",
--   base03 = "#525252",
--   base04 = "#dde1e6",
--   base05 = "#f2f4f8",
--   base06 = "#ffffff",
--   base07 = "#08bdba",
--   base08 = "#3ddbd9",
--   base09 = "#78a9ff",
--   base0A = "#ee5396",
--   base0B = "#33b1ff",
--   base0C = "#ff7eb6",
--   base0D = "#42be65",
--   base0E = "#be95ff",
--   base0F = "#82cfff",
-- }

-- local colors = {
--   cursor = oxocarbon.base04,
--   background = oxocarbon.base00,
--   foreground = oxocarbon.base06,
--   normal = {
--     black = oxocarbon.base00,
--     red = oxocarbon.base0B,
--     green = oxocarbon.base0C,
--     yellow = oxocarbon.base0D,
--     blue = oxocarbon.base07,
--     magenta = oxocarbon.base0F,
--     cyan = oxocarbon.base09,
--     white = oxocarbon.base04,
--     light_grey = oxocarbon.base02,
--   },
--   bright = {
--     black = oxocarbon.base03,
--     red = oxocarbon.base0B,
--     green = oxocarbon.base0C,
--     yellow = oxocarbon.base0D,
--     blue = oxocarbon.base07,
--     magenta = oxocarbon.base0F,
--     cyan = oxocarbon.base09,
--     white = oxocarbon.base06,
--   },
-- }

-- local u = require('core.utils')
-- local gruvbox = {
--   background = '#32302f',
--   normal = {
--     bg = u.extract_highlight_colours('GruvboxBg0').guifg,
--     black = u.extract_highlight_colours('GruvboxBg0').guifg,
--     yellow = u.extract_highlight_colours('GruvboxYellow').guifg,
--     cyan = u.extract_highlight_colours('GruvboxAqua').guifg,
--     blue = u.extract_highlight_colours('GruvboxBlue').guifg,
--     oceanblue = u.extract_highlight_colours('GruvboxAqua').guifg,
--     green = u.extract_highlight_colours('GruvboxGreen').guifg,
--     orange = u.extract_highlight_colours('GruvboxOrange').guifg,
--     violet = u.extract_highlight_colours('GruvboxPurple').guifg,
--     magenta = u.extract_highlight_colours('GruvboxRed').guifg,
--     white = u.extract_highlight_colours('GruvboxFg0').guifg,
--     fg = u.extract_highlight_colours('GruvboxFg0').guifg,
--     red = u.extract_highlight_colours('GruvboxRed').guifg,
--     light_grey = u.extract_highlight_colours('GruvboxBg3').guifg,
--   },
-- }

-- local colors = gruvbox

local palette = require("nordic.colors")
palette.bg = require("nordic.colors").bg_dark


local vi_mode_colors = {
  NORMAL = palette.green.base,
  OP = palette.green.base,
  INSERT = palette.red.base,
  CONFIRM = palette.red.base,
  VISUAL = palette.yellow.base,
  LINES = palette.blue.bright,
  BLOCK = palette.blue.bright,
  REPLACE = palette.blue.bright,
  ['V-REPLACE'] = palette.blue.bright,
  ENTER = palette.cyan.base,
  MORE = palette.cyan.base,
  SELECT = palette.yellow.base,
  COMMAND = palette.magenta.base,
  SHELL = palette.green.base,
  TERM = palette.green.base,
  NONE = palette.yellow.base
}

local c = {
  vi_mode_icon = {
    provider = '  ',
    -- provider = ' ',
    hl = function()
      local val = {}
      val.bg = vi_mode_colors[vi_mode_utils.get_vim_mode()]
      val.fg = palette.bg
      return val
    end,
    left_sep = 'block',
    right_sep = 'block',
  },
  vi_mode_text = {
    provider = function ()
      return  vi_mode_utils.get_vim_mode()
    end,
    hl = function()
      local val = {}
      val.bg = vi_mode_colors[vi_mode_utils.get_vim_mode()]
      val.fg = palette.bg
      return val
    end,
    left_sep = {
      str = 'block',
      hl = function()
        local val = {}
        val.fg = vi_mode_colors[vi_mode_utils.get_vim_mode()]
        val.bg = palette.bg
        return val
      end,
    },
    right_sep = {
      str = 'block',
      hl = function()
        local val = {}
        val.fg = vi_mode_colors[vi_mode_utils.get_vim_mode()]
        val.bg = palette.bg
        return val
      end,
    },
  },
  folder = {
    provider = function()
      local dir_name = dir_info()
      return "  " .. dir_name
    end,
    hl = function()
      local val = {}
      val.fg = palette.fg
      val.bg = palette.bg
      return val
    end,
    right_sep = 'block'
  },
  filename = {
    provider = 'file_info',
    opts = {
      type = 'relative'
    },
    hl = {
      fg = palette.fg,
      bg = palette.grey1,
      style = 'bold'
    },
    left_sep = 'block',
    right_sep = 'right_rounded'
  },
  git_diff_added = {
    provider = 'git_diff_added',
    hl = {
      fg = palette.green.base,
      bg = palette.bg
    },
    right_sep = 'block',
  },
  git_diff_removed = {
    provider = 'git_diff_removed',
    hl = {
      fg = palette.red.base,
      bg = palette.bg
    },
    right_sep = 'block',
  },
  git_diff_changed = {
    provider = 'git_diff_changed',
    hl = {
      fg = palette.yellow.base,
      bg = palette.bg
    },
    right_sep = 'block',
  },
  bg = {
    hl = {
      bg = palette.bg
    }
  },
  git_branch = {
    provider = 'git_branch',
    hl = {
      fg = palette.orange.base,
      bg = palette.bg
    },
    left_sep = 'block',
    right_sep = 'block'
  },
  line_percentage = {
    provider = 'line_percentage',
    hl = function()
      local val = {}
      val.fg = vi_mode_colors[vi_mode_utils.get_vim_mode()]
      val.bg = palette.bg
      return val
    end,
    left_sep = 'block',
    right_sep = 'block'
  },
  scroller = {
    provider = 'scroll_bar',
    hl = function()
      local val = {}
      val.fg = vi_mode_colors[vi_mode_utils.get_vim_mode()]
      val.bg = palette.bg
      return val
    end,
    left_sep = 'block',
    right_sep = 'block'
  },
  encoding = {
    provider = 'file_encoding',
    hl = {
      fg = palette.grey3,
      bg = palette.bg
    },
    left_sep = 'block',
    right_sep = 'block'
  },
  format = {
    provider = file_osinfo,
    hl = {
      fg = palette.grey3,
      bg = palette.bg
    },
    left_sep = 'block',
    right_sep = 'block'
  },
  lsp_name = {
    provider = 'lsp_client_names',
    hl = {
      fg = palette.blue.bright,
      bg = palette.bg
    },
    left_sep = 'block',
    right_sep = 'block'
  },
  diag_err = {
    provider = 'diagnostic_errors',
    hl = {
      fg = palette.red.base,
      bg = palette.bg
    }
  },
  diag_warn = {
    provider = 'diagnostic_warnings',
    hl = {
      fg = palette.yellow.base,
      bg = palette.bg
    }
  },
  diag_hint = {
    provider = 'diagnostic_hints',
    hl = {
      fg = palette.cyan.base,
      bg = palette.bg
    }
  },
  diag_info = {
    provider = 'diagnostic_info',
    hl = {
      fg = palette.purple,
      bg = palette.bg
    }
  },
  position = {
    provider = 'position',
    hl = {
      fg = palette.grey3,
      bg = palette.bg
    },
    left_sep = 'block',
    right_sep = 'block',
  }
}

local left = { c.bg, c.vi_mode_icon, c.filename, c.git_branch, c.git_diff_added, c.git_diff_removed, c.git_diff_changed, c.bg }
local right = { c.diag_info, c.diag_hint, c.diag_warn, c.diag_err, c.lsp_name, c.folder, c.format, c.encoding, c.position, c.line_percentage, c.scroller }

local components = {
  active = { left, right },
  inactive = {}
}

table.insert(components.inactive, {})
table.insert(components.inactive, {})


feline.setup({
  components = components,
  disable = {
    {
      filetypes = {
        '^NvimTree$',
        '^packer$',
        '^startify$',
        '^fugitive$',
        '^fugitiveblame$',
        '^qf$',
        '^help$'
      },
      buftypes = {
        -- '^terminal$'
      },
      bufnames = {}
    }
  }
})
