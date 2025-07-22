-- treesitter for syntax highlighting

local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	lazy = false,
}

M.config = function()
	local ok, treesitter = pcall(require, "nvim-treesitter")
	if not ok then
		return
	end

	treesitter.setup({
		"bash",
		"c",
		"cmake",
		"comment",
		"cpp",
		"cuda",
		"dap_repl",
		"dockerfile",
		"dot",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitignore",
		"go",
		"gomod",
		"gosum",
		"http",
		"json",
		"latex",
		"lua",
		"make",
		"markdown",
		"proto",
		"python",
		"query",
		"rst",
		"rust",
		"sql",
		"terraform",
		"toml",
		"vim",
		"vimdoc",
		"yaml",
	})
end

return M
