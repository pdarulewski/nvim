local Switcher = {}

function Switcher.switchTheme()
	local theme = os.getenv("THEME")
	print("Theme: " .. theme)

	if theme == "ocean" then
		return require("plugins.themes.ocean")
	elseif theme == "stone" then
		return require("plugins.themes.stone")
	else
		error("Theme not found")
	end
end

return Switcher
