local present, nvimtree = pcall(require, "nvim-tree")

if not present then
	return
end

local default = {
	view = {
		width = 40,
	},
    renderer = {
        indent_markers = {
          enable = true,
          icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
          },
        },
        icons = {
          webdev_colors = true,
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
}

local M = {}

M.setup = function()
	nvimtree.setup(default)
end

return M
