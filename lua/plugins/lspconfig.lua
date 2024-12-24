-- configuration for json and yaml schemas

local M = {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		"folke/neodev.nvim",
	},
}

M.config = function()
	local ok, lspconfig = pcall(require, "lspconfig")
	if not ok then
		return
	end

	local ok, lsp = pcall(require, "lsp-zero")
	if not ok then
		return
	end

	lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

	lspconfig.taplo.setup({
		settings = {
			toml = {
				schemas = {
					["http://json.schemastore.org/ruff"] = "./*.{toml}",
				},
			},
		},
	})

	lspconfig.yamlls.setup({
		settings = {
			yaml = {
				schemas = {
					["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
					["http://json.schemastore.org/github-action"] = "action.{yml,yaml}",
					["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
					["http://json.schemastore.org/pre-commit-config"] = "./.pre-commit-config.{yml,yaml}",
					["http://json.schemastore.org/github-workflow-template-properties"] = ".github/workflows/*.{yml,yaml}",
				},
			},
		},
	})

	lspconfig.sourcekit.setup({
		cmd = { "sourcekit-lsp" },
		filetypes = { "swift" },
		root_dir = lspconfig.util.root_pattern(".git", "Package.swift", "buildServer.json"),
	})
end

return M
