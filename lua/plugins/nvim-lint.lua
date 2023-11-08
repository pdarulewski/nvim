-- lint and diagnostics

local M = {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
}

M.config = function()
	local ok, lint = pcall(require, "nvim-lint")
	if not ok then
		return
	end

	lint.setup({
		lua = { "luacheck" },
		python = { "ruff" },
		markdown = { "markdownlint" },
		go = { "golangcilint" },
		json = { "jsonlint" },
		yaml = { "yamllint" },
		ansible = { "ansible-lint" },
		sh = { "shellcheck" },
		["*"] = { "codespell" },
	})
end
return M
