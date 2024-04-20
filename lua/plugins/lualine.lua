-- bottom statusline

local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
}

M.config = function()
	local ok, lualine = pcall(require, "lualine")
	if not ok then
		return
	end

	local lint_progress = function()
		local linters = require("lint").get_running()
		if #linters == 0 then
			return "󰦕"
		end
		return table.concat(linters, ", ") .. " 󱉶"
	end

	local active_formatters = function()
		local formatters = require("conform").list_formatters(0)
		local names = {}
		for _, formatter in ipairs(formatters) do
			table.insert(names, formatter.name)
		end
		return table.concat(names, " ♦ ")
	end

	lualine.setup({
		options = {
			globalstatus = true,
			theme = "tokyonight",
		},
		sections = {
			lualine_c = {
				{
					"filename",
					file_status = true,
					path = 1,
				},
			},
			lualine_x = {
				lint_progress,
				active_formatters,
				"encoding",
				"fileformat",
				"filetype",
			},
		},
	})
end

return M
