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
		result = {
			show_curl_command = true,
			show_statistics = {
				{
					"time_total",
					title = "Total Time: ",
					type = "time",
				},
			},
		},
	})
end

return M
