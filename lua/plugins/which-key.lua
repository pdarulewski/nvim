-- keymaps with a window after the leader key

local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

M.config = function()
	local ok, which_key = pcall(require, "which-key")
	if not ok then
		return
	end

	which_key.setup({
		window = {
			border = "single",
		},
	})

	local n_leader_mappings = {
		e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		p = { "<cmd>Telescope projects<cr>", "Projects" },
		s = { "<cmd>SymbolsOutline<cr>", "Symbols" },
		g = { "<cmd>LazyGit<cr>", "LazyGit" },

		n = { "<cmd>noh<cr>", "No highlight" },
		N = { "<cmd>lua require('notify').dismiss()<cr>", "Dismiss notifications" },

		R = { ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", "Replace all" },
		u = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
		v = { "<cmd>VenvSelect<cr>", "Select venv" },

		W = { "<cmd>noautocmd w<cr>", "Write without saving" },
		c = { "<cmd>bp|bd #<cr>", "Close Buffer" },
		q = { "<cmd>wa<cr><cmd>qa<cr>", "Quit" },

		["/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", "Comment" },

		h = {
			name = "+hop",
			a = { "<cmd>HopAnywhere<cr>", "Hop Anywhere" },
			w = { "<cmd>HopWord<cr>", "Hop Word" },
			c = { "<cmd>HopChar1<cr>", "Hop Char" },
		},

		d = {
			name = "+dap",
			p = {
				name = "+python",
				m = {
					"<cmd>lua require('dap-python').test_method({ config = { justMyCode = false } })<cr>",
					"Test Method",
				},
				c = {
					"<cmd>lua require('dap-python').test_class({ config = { justMyCode = false } })<cr>",
					"Test Class",
				},
				s = {
					"<cmd>lua require('dap-python').debug_selection({ config = { justMyCode = false } })<cr>",
					"Debug Selection",
				},
			},
			g = {
				name = "+go",
				m = { "<cmd>lua require('dap-go').debug_test()<cr>", "Test method" },
				l = { "<cmd>lua require('dap-go').debug_last_test()<cr>", "Test last method" },
			},
			u = { "<cmd>lua require('dapui').toggle({ reset = true })<cr>", "Toggle UI" },
			r = {
				"<cmd>lua require('dapui').close()<cr><cmd>lua require('dapui').toggle({ reset = true })<cr>",
				"Toggle UI",
			},
			c = { "<cmd>lua require('dapui').close()<cr>", "Close UI" },
			e = { "<cmd>lua require('dapui').eval()<cr>", "Evaluate" },
			t = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Breakpoint" },
			T = {
				"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
				"Conditional breakpoint",
			},
		},

		f = {
			name = "+find",
			f = { "<cmd>Telescope git_files hidden=true<cr>", "Git Files" },
			F = { "<cmd>Telescope find_files hidden=true<cr>", "Files" },
			t = { "<cmd>Telescope live_grep hidden=true<cr>", "Text" },
			r = { "<cmd>Telescope lsp_references<cr>", "References" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols" },
			T = { "<cmd>TodoTelescope<cr>", "TODOs" },
		},

		t = {
			name = "+trouble",
			t = { "<cmd>TroubleToggle<cr>", "Trouble" },
			w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace diagnostics" },
			d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document diagnostics" },
			q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
			l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
			r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
		},

		w = {
			name = "+worktree",
			c = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "Create" },
			l = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "List" },
		},

		r = {
			name = "+rest",
			r = { "<Plug>RestNvim<cr>", "Run" },
			l = { "<Plug>RestNvimLast<cr>", "Run last" },
			c = { "<Plug>RestNvimPreview<cr>", "cURL" },
		},
		L = { "<cmd>Lazy<cr>", "Lazy" },
		M = { "<cmd>Mason<cr>", "Mason" },
		x = { "<cmd>Lazy reload tokyonight.nvim<cr>", "Reload theme" },
		z = { "<cmd>ZenMode<cr>", "Zen Mode" },
		Z = { "<cmd>Twilight<cr>", "Toggle twilight" },
	}

	local n_leader_opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	}

	local v_leader_mappings = {
		["/"] = { "<Plug>(comment_toggle_linewise_visual)<CR>", "Comment" },

		d = {
			name = "+dap",
			p = {
				name = "+python",
				s = {
					"<cmd>lua require('dap-python').debug_selection({ config = { justMyCode = false } })<cr>",
					"Debug Selection",
				},
			},
			u = { "<cmd>lua require('dapui').toggle({ reset = true })<cr>", "Toggle UI" },
			r = {
				"<cmd>lua require('dapui').close()<cr><cmd>lua require('dapui').toggle({ reset = true })<cr>",
				"Toggle UI",
			},
			c = { "<cmd>lua require('dapui').close()<cr>", "Close UI" },
		},

		v = {
			name = "+vim",
			s = { ":'<,'>sort<cr>", "Sort" },
			S = { ":'<,'>sort!<cr>", "Sort inverse" },
			d = { ":'<,'>sort u<cr>", "Delete duplicated lines" },
		},

		["p"] = { '"_dP', "paste and keep" },
		["P"] = { '"_dp', "paste and keep" },
	}

	local v_leader_opts = {
		mode = "v",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	}
	which_key.register(n_leader_mappings, n_leader_opts)
	which_key.register(v_leader_mappings, v_leader_opts)
end

return M
