local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}

M.config = function()
	local ok, mason = pcall(require, "mason")
	if not ok then
		return
	end

	local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
	if not ok then
		return
	end

	mason_lspconfig.setup({
		ensure_installed = {
			"bashls",
			"buf_ls",
			"docker_compose_language_service",
			"dockerls",
			"gopls",
			"html",
			"lua_ls",
			"pyright",
			"yamlls",
		},
	})

	local registry = require("mason-registry")
	local packages = {
		-- formatters
		"luacheck",
		"html",
		"lemminx",
		"taplo",
		"marksman",
		"ltex",
		"shfmt",
		"sql_formatter",
		"markdown-toc",
		"mdformat",
		"luacheck",
		"prettier",

		-- linters
		"ansible-lint",
		"jsonlint",
		"markdownlint",
		"yamllint",
		"shellcheck",
		"codespell",
	}

	for _, pkg_name in ipairs(packages) do
		local ok, pkg = pcall(registry.get_package, pkg_name)
		if ok then
			if not pkg:is_installed() then
				pkg:install()
			end
		end
	end
end

return M
