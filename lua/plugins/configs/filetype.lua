local present, ft = pcall(require, "filetype")

if not present then
	return
end

-- this override doesnt work for some reason
-- so ive just replaced the sh extension function in filetype's function.lua
-- with the two lines from this function
local function bash_literal()
  vim.bo.filetype = 'sh'
  vim.b.is_bash = true
end

conf = {
  overrides = {
    extensions = {
      ["sh"] = bash_literal,
    },
  }
}

local M = {}
M.setup = function()
 ft.setup(conf)
end

return M
