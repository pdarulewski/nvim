-- configuration for json and yaml schemas

local M = {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		"folke/neodev.nvim",
	},
}

M.config = function()
	local ok, _ = pcall(require, "lspconfig")
	if not ok then
		return
	end
end

return M
