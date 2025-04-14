-- github integration

local M = {
	"pwntester/octo.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
}

M.config = function()
	local ok, octo = pcall(require, "octo")
	if not ok then
		return
	end

	octo.setup()
end

return M
