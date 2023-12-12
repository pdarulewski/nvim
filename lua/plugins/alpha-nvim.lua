-- welcome screen

local M = {
	"goolord/alpha-nvim",
	config = function()
		require("alpha").setup(require("alpha.themes.dashboard").config)
	end,
}

M.config = function()
	local ok, dashboard = pcall(require, "alpha.themes.dashboard")
	if not ok then
		return
	end

	dashboard.section.buttons.val = {
		dashboard.button("a", "  New file", ":ene <BAR> startinsert <cr>"),
		dashboard.button("p", "  Projects", "<cmd>Telescope projects<cr>"),
		dashboard.button("f", "  Find files", "<cmd>Telescope find_files hidden=true<cr>"),
		dashboard.button("t", "  Find text", "<cmd>Telescope live_grep hidden=true<cr>"),
		dashboard.button("q", "󰅖  Quit NVIM", ":qa<cr>"),
	}

	dashboard.section.header.val = {

		"   ____     ____     ____     ____     ____",
		" /    / \\ /    / \\ /    / \\ /    / \\ /    / \\",
		"/____/   /____/   /____/   /____/   /____/   \\",
		"\\    \\   \\    \\   \\    \\   \\    \\ __\\_   \\   /",
		" \\____\\ / \\____\\ / \\____\\ / \\___/    / \\__\\ /",
		"     /____/   \\                /____/   \\",
		"     \\    \\   /_             __\\_   \\   /",
		"      \\____\\ / / \\         /    / \\__\\ /",
		"         /____/   \\       /____/   \\",
		"         \\    \\   /_    __\\_   \\   /",
		"          \\____\\ / / \\/    / \\__\\ /",
		"             /____/   \\___/   \\",
		"             \\    \\   /   \\   /",
		"              \\____\\ // \\__\\ /",
		"                /____/   \\",
		"                \\    \\   /",
		"                 \\____\\ /",
	}

	require("alpha").setup(dashboard.config)
end

return M
