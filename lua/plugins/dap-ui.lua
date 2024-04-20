-- ui for dap

local M = {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	commit = "a6beb3a855b42faa1d0fee1081602257719c2c5e",
}

M.config = function()
	local ok, dapui = pcall(require, "dapui")
	if not ok then
		return
	end

	dapui.setup({
		layouts = {
			{
				elements = {
					{ id = "scopes", size = 0.25 },
					{ id = "breakpoints", size = 0.25 },
					{ id = "stacks", size = 0.25 },
					{ id = "watches", size = 0.25 },
				},
				position = "left",
				size = 50,
			},
			{
				elements = {
					{ id = "repl", size = 0.5 },
					{ id = "console", size = 0.5 },
				},
				position = "bottom",
				size = 10,
			},
		},
	})

	local ok, dap = pcall(require, "dap")
	if not ok then
		return
	end

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open({ reset = true })
	end
end

return M
