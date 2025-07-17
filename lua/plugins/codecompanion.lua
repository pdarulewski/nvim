local M = {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}

M.config = function()
	local ok, codecompanion = pcall(require, "codecompanion")
	if not ok then
		return
	end

	codecompanion.setup({})
end

return M
