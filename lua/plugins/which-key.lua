-- keymaps with a window after the leader key

local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {
		"echasnovski/mini.icons",
	},
}

M.config = function()
	local ok, which_key = pcall(require, "which-key")
	if not ok then
		return
	end

	which_key.setup({
		win = {
			border = "single",
		},
		triggers = {
			{ "<leader>", mode = { "n", "v" } },
		},
	})

	local n_leader_mappings = {
		mode = "n",
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
		{ "<leader>p", "<cmd>Telescope projects<cr>", desc = "Projects" },
		{ "<leader>s", "<cmd>SymbolsOutline<cr>", desc = "Symbols" },

		{ "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" },

		{ "<leader>n", "<cmd>noh<cr>", desc = "No highlight" },
		{ "<leader>w", "<cmd>set wrap!<cr>", desc = "Toggle wrap" },
		{ "<leader>W", "<cmd>noautocmd w<cr>", desc = "Write without saving" },
		{ "<leader>c", "<cmd>bp|bd #<cr>", desc = "Close Buffer" },
		{ "<leader>q", "<cmd>wa<cr><cmd>qa<cr>", desc = "Quit" },

		{ "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", desc = "Comment" },
		{ "<leader>a", "<cmd> lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },

		{ "<leader>N", "<cmd>lua require('notify').dismiss()<cr>", desc = "Dismiss notifications" },

		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
		{ "<leader>v", "<cmd>VenvSelect<cr>", desc = "Select venv" },

		{ "<leader>G", group = "+worktree" },
		{ "<leader>L", "<cmd>Lazy<cr>", desc = "Lazy" },
		{ "<leader>M", "<cmd>Mason<cr>", desc = "Mason" },
		{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
		{ "<leader>Z", "<cmd>Twilight<cr>", desc = "Toggle twilight" },
		{ "<leader>R", "<cmd> lua require('telescope').extensions.refactoring.refactors()<cr>", desc = "Refactor" },

		{ "<leader>h", group = "Hop" },
		{ "<leader>ha", "<cmd>HopAnywhere<cr>", desc = "Hop Anywhere" },
		{ "<leader>hw", "<cmd>HopWord<cr>", desc = "Hop Word" },
		{ "<leader>hc", "<cmd>HopChar1<cr>", desc = "Hop Char" },

		{ "<leader>d", group = "+dap" },
		{ "<leader>du", "<cmd>lua require('dapui').toggle({ reset = true })<cr>", desc = "Toggle UI" },
		{
			"<leader>dR",
			"<cmd>lua require('dapui').close()<cr><cmd>lua require('dapui').toggle({ reset = true })<cr>",
			desc = "Toggle UI",
		},
		{ "<leader>dc", "<cmd>lua require('dapui').close()<cr>", desc = "Close UI" },
		{ "<leader>de", "<cmd>lua require('dapui').eval()<cr>", desc = "Evaluate" },
		{ "<leader>dt", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Breakpoint" },
		{
			"<leader>dT",
			"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
			desc = "Conditional breakpoint",
		},

		{ "<leader>dp", group = "+python" },
		{
			"<leader>dpm",
			"<cmd>lua require('dap-python').test_method({ config = { justMyCode = false } })<cr>",
			desc = "Test Method",
		},
		{
			"<leader>dpc",
			"<cmd>lua require('dap-python').test_class({ config = { justMyCode = false } })<cr>",
			desc = "Test Class",
		},
		{
			"<leader>dps",
			"<cmd>lua require('dap-python').debug_selection({ config = { justMyCode = false } })<cr>",
			desc = "Debug Selection",
		},

		{ "<leader>dg", group = "+go" },
		{ "<leader>dgm", "<cmd>lua require('dap-go').debug_test()<cr>", desc = "Test method" },
		{ "<leader>dgl", "<cmd>lua require('dap-go').debug_last_test()<cr>", desc = "Test last method" },

		{ "<leader>dr", "<cmd>RustLsp debuggables<cr>", desc = "rust" },

		{ "<leader>dx", group = "+xcode" },
		{ "<leader>dxt", "<cmd>XcodebuildTest<cr>", desc = "Run Tests" },
		{ "<leader>dxs", "<cmd>XcodebuildTestSelected<cr>", desc = "Run Selected Tests" },
		{ "<leader>dxc", "<cmd>XcodebuildTestClass<cr>", desc = "Run Current Test Class" },
		{ "<leader>dxl", "<cmd>XcodebuildTestRepeat<cr>", desc = "Repeat Last Test Run" },

		{ "<leader>f", group = "+find" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>ff", "<cmd>Telescope git_files hidden=true<cr>", desc = "Git Files" },
		{ "<leader>fF", "<cmd>Telescope find_files hidden=true<cr>", desc = "Files" },
		{ "<leader>fp", "<cmd>Telescope live_grep search_dirs=./.venv hidden=true<cr>", desc = "In project" },
		{ "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
		{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },
		{ "<leader>ft", "<cmd>Telescope live_grep hidden=true<cr>", desc = "Text" },
		{ "<leader>fT", "<cmd>TodoTelescope<cr>", desc = "TODOs" },
		{ "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy search here" },

		{ "<leader>o", group = "+octo" },
		{ "<leader>op", "<cmd>lua require('octo')<cr><cmd>Octo pr list<cr>", desc = "PRs" },
		{ "<leader>opr", "<cmd>lua require('octo')<cr><cmd>Octo review<cr>", desc = "Review" },
		{ "<leader>ops", "<cmd>lua require('octo')<cr><cmd>Octo review submit<cr>", desc = "Submit" },
		{ "<leader>opc", "<cmd>lua require('octo')<cr><cmd>Octo review comments<cr>", desc = "Submit" },

		{ "<leader>t", group = "+trouble" },
		{ "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble" },

		{
			"<leader>wc",
			"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
			desc = "Create",
		},
		{ "<leader>wl", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", desc = "List" },

		{ "<leader>r", group = "+rest" },
		{ "<leader>rr", "<cmd>horizontal Rest run<cr>", desc = "Run" },
		{ "<leader>rl", "<cmd>Rest last<cr>", desc = "Run last" },

		{ "<leader>X", group = "+xcodebuild" },
		{ "<leader>Xx", "<cmd>XcodebuildPicker<cr>", desc = "Show Xcodebuild Actions" },
		{ "<leader>Xs", "<cmd>XcodebuildSetup<cr>", desc = "Setup project" },
		{ "<leader>Xm", "<cmd>XcodebuildProjectManager<cr>", desc = "Show Project Manager Actions" },
		{ "<leader>Xb", "<cmd>XcodebuildBuild<cr>", desc = "Build Project" },
		{ "<leader>XB", "<cmd>XcodebuildBuildForTesting<cr>", desc = "Build For Testing" },
		{ "<leader>Xr", "<cmd>XcodebuildBuildRun<cr>", desc = "Build & Run Project" },
		{ "<leader>Xl", "<cmd>XcodebuildToggleLogs<cr>", desc = "Toggle Xcodebuild Logs" },
		{ "<leader>Xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", desc = "Toggle Code Coverage" },
		{ "<leader>XC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", desc = "Show Code Coverage Report" },
		{ "<leader>Xe", "<cmd>XcodebuildTestExplorerToggle<cr>", desc = "Toggle Test Explorer" },
		{ "<leader>Xf", "<cmd>XcodebuildFailingSnapshots<cr>", desc = "Show Failing Snapshots" },
		{ "<leader>Xd", "<cmd>XcodebuildSelectDevice<cr>", desc = "Select Device" },
		{ "<leader>Xp", "<cmd>XcodebuildSelectTestPlan<cr>", desc = "Select Test Plan" },
		{ "<leader>Xq", "<cmd>XcodebuildQuickfixLine<cr>", desc = "Quickfix Line" },
		{ "<leader>Xa", "<cmd>XcodebuildCodeActions<cr>", desc = "Show Code Actions" },

		{ "<leader>x", group = "+meta" },
		{ "<leader>xi", "<cmd>Inspect<cr>", desc = "Inspect treesitter object" },
	}

	local v_leader_mappings = {
		mode = "v",
		{ "<leader>R", "<cmd> lua require('telescope').extensions.refactoring.refactors()<cr>", desc = "Refactor" },
		{ "<leader>p", '"_dP', desc = "paste and keep" },
		{ "<leader>P", '"_dp', desc = "paste and keep" },
		{ "<leader>/", "<Plug>(comment_toggle_linewise_visual)<CR>", desc = "Comment" },

		{ "<leader>d", group = "+dap" },
		{ "<leader>du", "<cmd>lua require('dapui').toggle({ reset = true })<cr>", desc = "Toggle UI" },
		{
			"<leader>dr",
			"<cmd>lua require('dapui').close()<cr><cmd>lua require('dapui').toggle({ reset = true })<cr>",
			desc = "Toggle UI",
		},
		{ "<leader>dc", "<cmd>lua require('dapui').close()<cr>", desc = "Close UI" },

		{ "<leader>dp", group = "+python" },
		{
			"<leader>dps",
			"<cmd>lua require('dap-python').debug_selection({ config = { justMyCode = false } })<cr>",
			desc = "Debug Selection",
		},

		{ "<leader>v", group = "+vim" },
		{ "<leader>vs", ":'<,'>sort<cr>", desc = "Sort" },
		{ "<leader>vS", ":'<,'>sort!<cr>", desc = "Sort inverse" },
		{ "<leader>vd", ":'<,'>sort u<cr>", desc = "Delete duplicated lines" },
		{ "<leader>vr", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace all" },
	}

	which_key.add(n_leader_mappings)
	which_key.add(v_leader_mappings)
end

return M
