-- refactor imports after file moves

local M = {
	"antosha417/nvim-lsp-file-operations",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-tree.lua",
	},
}

M.config = function()
	local ok, operations = pcall(require, "lsp-file-operations")
	if not ok then
		return
	end

	operations.setup({
		debug = true,
	})
end

return M
