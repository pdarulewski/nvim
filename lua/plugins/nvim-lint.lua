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
		ansible = { "ansible-lint" },
		env = { "shellcheck" },
		go = { "golangcilint" },
		json = { "jsonlint" },
		lua = { "luacheck" },
		markdown = { "markdownlint" },
		python = { "ruff" },
		sh = { "shellcheck" },
		swift = { "swiftlint" },
		sql = { "sqlfluff" },
		yaml = { "yamllint" },
		["*"] = { "codespell" },
	}

	vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end
return M
