-- nvim in kitty

local M = {
	"mikesmithgh/kitty-scrollback.nvim",
	version = "^2.0.0",
	lazy = true,
	enabled = true,
	cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
	event = { "User KittyScrollbackLaunch" },
}

M.config = function()
	local ok, kitty = pcall(require, "kitty-scrollback")
	if not ok then
		return
	end

	kitty.setup()
end

return M
