local M = {
	"williamboman/mason-lspconfig.nvim",
}

M.config = function()
	require("mason").setup()

	local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
	if not ok then
		return
	end

	local lsp_zero = require("lsp-zero")

	mason_lspconfig.setup({
		handlers = {
			lsp_zero.default_setup,
			lua_ls = function()
				local lua_opts = lsp_zero.nvim_lua_ls()
				require("lspconfig").lua_ls.setup(lua_opts)
			end,
		},
		ensure_installed = {
			"lua_ls",
			"bashls",
			"yamlls",
			"gopls",
			"pyright",
			"rust_analyzer",
			"dockerls",
			"docker_compose_language_service",
		},
	})

	local registry = require("mason-registry")
	local packages = {
		-- formatters
		"luacheck",
		"html",
		"lemminx",
		"taplo",
		"sqlls",
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
