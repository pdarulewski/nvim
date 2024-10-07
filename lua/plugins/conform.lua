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
			go = { "gofumpt", "goimports-reviser" },
			javascript = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { "markdown-toc" },
			-- markdown = { "markdown-toc", "mdformat" },
			python = { "ruff_fix", "ruff_format" },
			rust = { "rustfmt" },
			sh = { "shfmt", "shellcheck" },
			sql = { "pg_format" },
			swift = { "swiftformat" },
			terraform = { "terraform_fmt" },
			toml = { "taplo" },
			typescript = { "prettier" },
			yaml = { "yamlfmt" },
			zsh = { "shfmt", "shellcheck" },
			["*"] = { "trim_newlines", "trim_whitespace", "codespell" },
		},
		notify_on_error = true,
	})

	conform.formatters.codespell = {
		prepend_args = { "--config", "/Users/pd/.config/codespell/setup.cfg" },
	}

	conform.formatters.taplo = {
		inherit = false,
		command = "taplo",
		args = { "format", "--config", "/Users/pd/.config/taplo/taplo.toml", "-" },
	}

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			require("conform").format({ bufnr = args.buf })
		end,
	})
end
return M
