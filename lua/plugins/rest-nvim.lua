-- postman-like rest

local M = {
	"rest-nvim/rest.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	commit = "91badd46c60df6bd9800c809056af2d80d33da4c",
}

M.config = function()
	local ok, rest = pcall(require, "rest-nvim")
	if not ok then
		return
	end

	rest.setup({
		result_split_in_place = true,
		result_split_horizontal = true,
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
		formatters = {
			json = "jq",
		},
	})
end

return M
