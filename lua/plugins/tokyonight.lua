-- tokyonight theme

local M = {
	"folke/tokyonight.nvim",
	event = "VimEnter",
}

M.config = function()
	require("tokyonight").setup({
		style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
		transparent = true, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			-- sidebars = "transparent", -- style for sidebars, see below
			-- floats = "transparent",   -- style for floating windows
			-- sidebars = "dark", -- style for sidebars, see below
			-- floats = "dark",   -- style for floating windows
		},
		sidebars = { "qf", "terminal", "packer" },
		dim_inactive = true,
		on_highlights = function(hl, colors)
			hl.LineNr = { fg = colors.cyan }
			hl.CursorLineNr = { fg = colors.yellow, bold = true }

			hl.String = {
				fg = colors.cyan,
				-- bold = true,
				-- style = { italic = true },
			}
			hl["@property"] = { fg = colors.blue1 }
			hl.Function = { fg = colors.blue1, bold = true }
			hl["@parameter"] = { fg = colors.purple }
			hl["@string.documentation"] = { fg = "#84aad6" }

			-- if, for
			hl.Statement = { fg = colors.magenta, style = { italic = true } }

			-- in keyword in python
			-- hl["@operator"] = { fg = colors.magenta, style = { italic = true } }

			-- def
			hl["@keyword.function"] = { fg = colors.magenta, style = { italic = true } }
		end,

		on_colors = function(colors)
			colors.hint = colors.orange
			colors.comment = "#84aad6"
			colors.error = colors.red1
		end,
	})

	vim.cmd.colorscheme("tokyonight")
end

return M
