-- plugins that don't need any setup

return {
	-- diagnostics, references in quickfix lists
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- lazygit in nvim terminal
	{ "kdheepak/lazygit.nvim" },

	-- go back to any previous change
	{ "mbbill/undotree" },

	-- highlight all words under cursor
	{ "RRethy/vim-illuminate" },

	-- comment lines
	{ "numToStr/Comment.nvim" },
}
