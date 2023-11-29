-- formatters

local M = {
	"stevearc/conform.nvim",
}

M.config = function()
	local ok, conform = pcall(require, "conform")
	if not ok then
		return
	end

	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format" },
			toml = { "taplo" },
			go = { "gofumpt", "goimports-reviser", "golines" },
			markdown = { "markdown-toc", "mdformat" },
			sql = { "pg_format", "sql_formatter" },
			rust = { "rustfmt" },
			sh = { "shfmt", "shellcheck" },
			zsh = { "shfmt", "shellcheck" },
			terraform = { "terraform_fmt" },
			yaml = { "yamlfmt" },
			json = { "prettier" },
			["*"] = { "trim_newlines", "trim_whitespace", "codespell" },
		},
		notify_on_error = true,
	})

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			require("conform").format({ bufnr = args.buf })
		end,
	})
end
return M
