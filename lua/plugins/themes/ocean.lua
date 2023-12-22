local Ocean = {}

-- catppuccin macchiato colors
local text = "#cad3f5"
local overlay_1 = "#8087a2"
local sapphire = "#7dc4e4"
local peach = "#f5a97f"
local blue = "#8aadf4"
local mauve = "#c6a0f6"
local green = "#a6da95"
local pink = "#f5bde6"
local magenta = "#ff476f"
local orange = "#ff692d"
local teal = "#8bd5ca"
local lavender = "#b7bdf8"

local blue1 = "#7dc4e4"
local blue2 = "#7BBAF9"

local blue = "#82aaff"
local blue0 = "#3e68d7"
local blue1 = "#65bcff"
local blue2 = "#0db9d7"
local blue3 = "#54c9dd"
local blue5 = "#89ddff"
local blue6 = "#b4f9f8"
local blue7 = "#394b70"
local border = "#1b1d2b"
local border_highlight = "#589ed7"
local comment = "#636da6"
local cyan = "#86e1fc"
local cyan1 = "#cef3ff"
local dark3 = "#545c7e"
local dark5 = "#737aa2"

function Ocean.on_highlights(highlights, colors)
	highlights.LineNr = { fg = sapphire }
	highlights.CursorLineNr = { fg = peach, bold = true }

	highlights.String = { fg = blue } -- "string"
	highlights["@string.documentation"] = { fg = overlay_1 }

	highlights["@property"] = { fg = blue1 } -- k.property
	highlights["@field"] = { fg = text } -- class K: property: int
	highlights["@constructor"] = { fg = blue2, bold = true } -- __init__
	highlights.Function = { fg = blue2 } -- def f():
	highlights.Type = { fg = blue2, bold = true } -- class K:
	highlights.Constant = { fg = pink }
	highlights["@parameter"] = { fg = border_highlight }
	highlights["@number"] = { fg = blue6 }

	highlights["@variable.builtin"] = { fg = text, style = { italic = true } } -- self
	highlights.Statement = { fg = mauve, style = { italic = true } } -- if, for
	highlights["@operator"] = { fg = mauve } -- in, =, +
	highlights["@keyword.function"] = { fg = mauve, style = { italic = true } } -- def
end

function Ocean.on_colors(colors)
	colors.hint = colors.orange
	colors.comment = overlay_1
	colors.error = magenta
	-- colors.orange = orange
end

return Ocean
