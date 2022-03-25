local present, impatient = pcall(require, "impatient")

if present then
	impatient.enable_profile()
end

local core_modules = {
	"core.misc",
	"core.mappings",
	"core.options",
}

for _, module in ipairs(core_modules) do
	local ok, err = pcall(require, module)
	if not ok then
		error("Error loading " .. module .. "\n\n" .. err)
	end
end

-- non plugin mappings
require("core.mappings").misc()

-- call plugins
require("plugins")

-- call colours
require("colours").init("kanagawa")
