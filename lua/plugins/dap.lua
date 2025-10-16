-- debugging configuration per language

local M = {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
	},
}

M.config = function()
	local ok, dap = pcall(require, "dap")
	if not ok then
		return
	end

	vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#ff476f", bg = "#394b70" })
	vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#82aaff", bg = "#394b70" })
	vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#96eab0", bg = "#394b70" })

	vim.fn.sign_define(
		"DapBreakpoint",
		{ text = "󰃤", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)
	vim.fn.sign_define(
		"DapBreakpointCondition",
		{ text = "󰨮", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)
	vim.fn.sign_define(
		"DapBreakpointRejected",
		{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)
	vim.fn.sign_define(
		"DapLogPoint",
		{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
	)
	vim.fn.sign_define(
		"DapStopped",
		{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
	)

	vim.keymap.set("n", "<F2>", function()
		require("dap").step_into()
	end)
	vim.keymap.set("n", "<F3>", function()
		require("dap").step_over()
	end)
	vim.keymap.set("n", "<F4>", function()
		require("dap").step_out()
	end)
	vim.keymap.set("n", "<F5>", function()
		require("dap").continue()
	end)
	vim.keymap.set("n", "<F6>", function()
		require("dap").restart()
	end)
	vim.keymap.set("n", "<F7>", function()
		require("dap").close()
	end)
	vim.keymap.set("n", "<F8>", function()
		require("dap").run_last()
	end)

	local ok, dap_python = pcall(require, "dap-python")
	if not ok then
		return
	end

	dap_python.setup("/Users/pd/repo/debug/.venv/bin/python")
	dap_python.test_runner = "pytest"
	dap.configurations.python = {}

	local ok, dap_go = pcall(require, "dap-go")
	if not ok then
		return
	end

	dap_go.setup()

	dap.adapters.delve = function(callback, config)
		if config.mode == "remote" and config.request == "attach" then
			callback({
				type = "server",
				host = config.host or "127.0.0.1",
				port = config.port or "38697",
			})
		else
			callback({
				type = "server",
				port = "${port}",
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
					detached = vim.fn.has("win32") == 0,
				},
			})
		end
	end

	dap.configurations.go = {
		{
			type = "delve",
			name = "file",
			request = "launch",
			program = "${file}",
			outputMode = "remote",
		},
	}
	-- dap.providers.configs["dap.launch.json"] = nil

	dap.providers.configs["air"] = function(bufnr)
		return {
			{
				name = "attach to air",
				type = "go",
				mode = "remote",
				outputMode = "remote",
				request = "attach",
				host = "127.0.0.1",
				port = 9999,
			},
		}
	end

	dap.providers.configs["gofile"] = function(bufnr)
		return {
			{
				name = "run current go file",
				type = "go",
				request = "launch",
				program = "${file}",
				outputMode = "remote",
			},
		}
	end

	-- require("dap.ext.vscode").json_decode = require("json5").parse

	-- local ok, vscode = pcall(require, "dap.ext.vscode")
	-- if not ok then
	-- 	return
	-- end
end

return M
