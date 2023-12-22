-- tokyonight theme

local M = {
	"folke/tokyonight.nvim",
	event = "VimEnter",
}

M.config = function()
	local switcher = require("plugins.themes.switcher")
	local current_theme = switcher.switchTheme()
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
		on_highlights = current_theme.on_highlights,
		on_colors = current_theme.on_colors,
	})

	vim.cmd.colorscheme("tokyonight")
end

return M
