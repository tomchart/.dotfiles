local present, impatient = pcall(require, "impatient")

if present then
	impatient.enable_profile()
end

local core_modules = {
	"core.mappings",
}

for _, module in ipairs(core_modules) do
	local ok, err = pcall(require, module)
	if not ok then
		error("Error loading " .. module .. "\n\n" .. err)
	end
end

require("core.mappings").misc()

-- require("core.mappings").nvimtree()
-- require("core.mappings").tele()
-- require("core.mappings").bufferline()
-- require("core.mappings").lspconf()
-- require("core.mappings").trouble()

require("mappings")
require("options")
require("colours")
require("misc")
require("plugins.packer")
