local M = {
	"williamboman/mason-lspconfig.nvim",
	event = "VeryLazy",
}

M.config = function()
	require("mason").setup()

	local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
	if not ok then
		return
	end

	local lsp_zero = require("lsp-zero")

	mason_lspconfig.setup({
		ensure_installed = {
			"bashls",
			"lua_ls",
			"rust_analyzer",
			"pyright",
			"gopls",

			"dockerls",
			"docker_compose_language_service",
			"html",
			"jsonls",
			"vimls",
			"yamlls",
			"taplo",
			"sqlls",
			"marksman",
			"ltex",
		},
		automatic_installation = true,
		handlers = {
			lsp_zero.default_setup,
		},
	})
	local registry = require("mason-registry")
	local linters = {
		"ansible-lint",
		"markdownlint",
		"yamllint",
		"shellcheck",
	}
	for _, pkg_name in ipairs(linters) do
		local ok, pkg = pcall(registry.get_package, pkg_name)
		if ok then
			if not pkg:is_installed() then
				pkg:install()
			end
		end
	end
end

return M
