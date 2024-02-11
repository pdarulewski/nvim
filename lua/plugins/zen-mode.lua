-- buffer in the middle of the window

local M = {
	"folke/zen-mode.nvim",
	event = "VeryLazy",
	opts = {
		window = {
			width = 150,
		},
		plugins = {
			twilight = { enabled = false },
		},
	},
}

return M
