-- lint and diagnostics

local M = {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
}

M.config = function()
	local ok, lint = pcall(require, "lint")
	if not ok then
		return
	end

	lint.linters_by_ft = {
		lua = { "luacheck" },
		python = { "ruff" },
		markdown = { "markdownlint" },
		go = { "golangcilint" },
		json = { "jsonlint" },
		yaml = { "yamllint" },
		ansible = { "ansible-lint" },
		sh = { "shellcheck" },
		["*"] = { "codespell" },
	}

	vim.api.nvim_create_autocmd({ "BufReadPost" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end
return M
