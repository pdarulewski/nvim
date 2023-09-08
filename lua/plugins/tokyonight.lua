-- tokyonight theme

local M = {
	"folke/tokyonight.nvim",
	event = "VimEnter",
}

M.config = function()
	local white = "#ffffff"
	local grey = "#84aad6"
	local magenta = "#ff476f"
	local orange = "#ff692d"

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
			hl.LineNr = { fg = colors.cyan }
			hl.CursorLineNr = { fg = colors.yellow, bold = true }

			hl.String = { fg = colors.cyan } -- "string"
			hl["@string.documentation"] = { fg = grey }

			hl["@property"] = { fg = colors.blue1 } -- k.property
			hl["@field"] = { fg = white } -- class K: property: int
			hl["@constructor"] = { fg = colors.blue2, bold = true } -- __init__
			hl.Function = { fg = colors.blue2 } -- def f():
			hl.Type = { fg = colors.blue2, bold = true } -- class K:
			-- hl.Constant = { fg = magenta }
			hl["@variable.builtin"] = { fg = grey, style = { italic = true } } -- self
			hl["@parameter"] = { fg = colors.purple }

			hl.Statement = { fg = colors.magenta, style = { italic = true } } -- if, for
			-- hl["@label"] = { fg = colors.red }
			-- hl["@namespace"] = { fg = colors.red }

			-- in, =, + keyword in python
			-- hl["@operator"] = { fg = colors.magenta, style = { italic = true } }

			-- def
			hl["@keyword.function"] = { fg = colors.magenta, style = { italic = true } }
		end,

		on_colors = function(colors)
			colors.hint = colors.orange
			colors.comment = grey
			colors.error = magenta
			-- colors.orange = orange
		end,
	})

	vim.cmd.colorscheme("tokyonight")
end

return M
