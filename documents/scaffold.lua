local generators = require("./generators")

local values = {
	author = {
		description = "Author of the package? (used in license for example)",
		type = "string",
	},
	license = {
		description = "Type of license to use.",
		type = "enum",
		choices = { "MIT", "Apache 2.0" },
	},
} ---@type table<string, Value>

---@type Scaffold
return {
	description = "Generates documents like LICENSE.md, CONTRIBUTORS.md and more",
	construct = function()
		if values.get("add_license") then
			generators.license()
		end
	end,
	values = {
		author = values.author,
		license = values.license,
		add_license = {
			type = "bool",
			description = "Add a LICENSE.md?",
		},
	},
	patches = {
		add_license = {
			description = "Adds a LICENSE.md to the project, with different license choices.",
			run = generators.license,
			values = {
				author = values.author,
				license = values.license,
			},
		},
	},
}
