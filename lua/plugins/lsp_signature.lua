-- function signature help

local M = {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
}

M.config = function()
	local ok, lsp_signature = pcall(require, "lsp_signature")
	if not ok then
		return
	end

	lsp_signature.setup()

	vim.keymap.set({ "n" }, "<C-Space>", function()
		require("lsp_signature").toggle_float_win()
	end, { silent = true, noremap = true, desc = "toggle signature" })
end

return M
