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

	require("tokyonight").setup({
		style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
		transparent = true, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			sidebars = "transparent", -- style for sidebars, see below
			floats = "transparent", -- style for floating windows
			-- sidebars = "dark", -- style for sidebars, see below
			-- floats = "dark",   -- style for floating windows
		},
		sidebars = { "qf", "terminal", "packer" },
		dim_inactive = true,
		on_highlights = function(hl, colors)
			local sapphire = colors.cyan

			hl.LineNr = { fg = sapphire }
			hl.CursorLineNr = { fg = peach, bold = true }

			hl.String = { fg = sapphire } -- "string"
			hl["@string.documentation"] = { fg = overlay_1 }

			hl["@property"] = { fg = colors.blue1 } -- k.property
			hl["@field"] = { fg = text } -- class K: property: int
			hl["@constructor"] = { fg = colors.blue2, bold = true } -- __init__
			hl.Function = { fg = colors.blue2 } -- def f():
			hl.Type = { fg = colors.blue2, bold = true } -- class K:
			-- hl.Constant = { fg = magenta }
			hl["@variable.builtin"] = { fg = overlay_1, style = { italic = true } } -- self
			hl["@parameter"] = { fg = peach }

			hl.Statement = { fg = mauve, style = { italic = true } } -- if, for
			-- hl["@label"] = { fg = colors.red }
			-- hl["@namespace"] = { fg = colors.red }

			-- in, =, + keyword in python
			-- hl["@operator"] = { fg = colors.magenta, style = { italic = true } }

			-- def
			hl["@keyword.function"] = { fg = colors.magenta, style = { italic = true } }
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
