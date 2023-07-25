-- set leader to space
vim.g.mapleader = " "

-- call plugins
require("plugins")

-- imp
require("impatient").enable_profile()

-- core
require("core.misc")
require("core.mappings")
require("core.options")
