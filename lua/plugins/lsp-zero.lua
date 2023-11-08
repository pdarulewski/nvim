-- lsp support

local M = {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
	},
}

M.config = function()
	local ok, lsp = pcall(require, "lsp-zero")
	if not ok then
		return
	end
	lsp.preset({})

	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
	vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
	vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

	vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>")
	vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>")

	vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
	vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

	lsp.set_sign_icons({
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "»",
	})

	lsp.setup()

	local kind_icons = {
		Text = "",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰇽",
		Variable = "󰂡",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "󰅲",
	}

	local cmp = require("cmp")
	cmp.setup({
		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = function(entry, vim_item)
				vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
				vim_item.menu = ({
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
					nvim_lua = "[Lua]",
					latex_symbols = "[LaTeX]",
				})[entry.source.name]

				return vim_item
			end,
		},
	})
end

return M
