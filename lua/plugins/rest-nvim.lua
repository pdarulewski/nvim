-- postman-like rest

local M = {
	"rest-nvim/rest.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

M.config = function()
	local ok, rest = pcall(require, "rest-nvim")
	if not ok then
		return
	end

	rest.setup({
		result_split_in_place = true,
	})
end

return M
