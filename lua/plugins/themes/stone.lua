local Stone = {}

function Stone.on_highlights(highlights, colors) end

function Stone.on_colors(colors)
	colors.bg = "#737aa2"
	colors.bg_dark = "#737aa2"
	colors.bg_float = "#252739" -- telescope background
	colors.bg_highlight = "#73768D"
	colors.bg_popup = "#737aa2"
	colors.bg_search = "#737aa2"
	colors.bg_sidebar = "#252739" -- tree background
	colors.bg_statusline = "#252739" -- statusline middle background
	colors.bg_visual = "#737aa2"

	colors.fg = "#D6D6DE" -- general text, Class name, telescope, lazygit frame
	colors.fg_dark = "#737aa2"
	colors.fg_float = "#737aa2"
	colors.fg_gutter = "#737aa2"
	colors.fg_sidebar = "#737aa2"

	colors.border = "#737aa2"
	colors.border_highlight = "#737aa2"

	colors.black = "#737aa2"

	colors.blue = "#D6D6DE" -- directory name, function name
	colors.blue0 = "#737aa2" -- ?
	colors.blue1 = "#6EADCC" -- alpha logo, telescope match, function call
	colors.blue2 = "#737aa2" -- ?
	colors.blue5 = "#FDFDFD" -- equal signs, dots, commas
	colors.blue6 = "#737aa2" -- ?
	colors.blue7 = "#737aa2" -- ?

	colors.cyan = "#A0E9F2" -- text accents, terminal cyan
	colors.dark3 = "#737aa2"
	colors.dark5 = "#737aa2"

	colors.green = "#94BFF3" -- strings, insert mode
	colors.green1 = "#A2C1F5" -- properties, terminal mode
	colors.green2 = "#737aa2" -- ?
	colors.magenta = "#94BFF3" -- {} brackets, visual mode, function keyword
	colors.magenta2 = "#737aa2" -- ?
	colors.orange = "#737aa2" -- ?
	colors.purple = "#737aa2" -- ?
	colors.red = "#737aa2" -- removed from lazygit
	colors.red1 = "#737aa2"
	colors.teal = "#737aa2" -- ?
	colors.yellow = "#FDFDFD" -- arguments

	colors.terminal_black = "#737aa2"

	colors.none = "NONE"

	colors.error = "#DC7DB7"
	colors.warning = "#737aa2"
	colors.info = "#737aa2"
	colors.comment = "#737aa2"
	colors.hint = "#F4A45F"

	colors.delta = {
		add = "#737aa2",
		delete = "#737aa2",
	}
	colors.diff = {
		add = "#737aa2",
		change = "#737aa2",
		delete = "#737aa2",
		text = "#737aa2",
	}
	colors.git = {
		add = "#737aa2",
		change = "#737aa2",
		delete = "#737aa2",
		ignore = "#737aa2",
	}
	colors.gitSigns = {
		add = "#737aa2",
		change = "#737aa2",
		delete = "#737aa2",
	}
end

return Stone
