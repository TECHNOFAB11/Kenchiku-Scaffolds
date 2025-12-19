return {
	license = function()
		local license = values.get("license") ---@type string
		local author = values.get("author") ---@type string
		local result = tmpl.template_file("LICENSE.md.tmpl", {
			license = license,
			author = author,
		})
		fs.write("LICENSE.md", result)
	end,
}
