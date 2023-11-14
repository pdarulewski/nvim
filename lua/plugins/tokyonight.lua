-- tokyonight theme

local M = {
	"folke/tokyonight.nvim",
	event = "VimEnter",
}

M.config = function()
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

	require("tokyonight").setup({
		style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
		transparent = true, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			sidebars = "transparent", -- style for sidebars, see below
			floats = "transparent", -- style for floating windows
		},
		sidebars = { "qf", "terminal", "packer" },
		dim_inactive = true,
		on_highlights = function(hl, colors)
			hl.LineNr = { fg = sapphire }
			hl.CursorLineNr = { fg = peach, bold = true }

			hl.String = { fg = blue } -- "string"
			hl["@string.documentation"] = { fg = overlay_1 }

			hl["@property"] = { fg = blue1 } -- k.property
			hl["@field"] = { fg = text } -- class K: property: int
			hl["@constructor"] = { fg = blue2, bold = true } -- __init__
			hl.Function = { fg = blue2 } -- def f():
			hl.Type = { fg = blue2, bold = true } -- class K:
			hl.Constant = { fg = pink }
			hl["@parameter"] = { fg = border_highlight }
			hl["@number"] = { fg = blue6 }

			hl["@variable.builtin"] = { fg = text, style = { italic = true } } -- self
			hl.Statement = { fg = mauve, style = { italic = true } } -- if, for
			hl["@operator"] = { fg = mauve, style = { italic = true } } -- in, =, +
			hl["@keyword.function"] = { fg = mauve, style = { italic = true } } -- def
		end,

		on_colors = function(colors)
			colors.hint = colors.orange
			colors.comment = overlay_1
			colors.error = magenta
			-- colors.orange = orange
		end,
	})

	vim.cmd.colorscheme("tokyonight")
end

return M
