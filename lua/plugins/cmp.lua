-- completions for functions and variables

local M = {
	"hrsh7th/nvim-cmp",
	event = "VeryLazy",
	dependencies = {
		"hrsh7th/cmp-path",
		"rcarriga/cmp-dap",
	},
}

M.config = function()
	local ok, cmp = pcall(require, "cmp")
	if not ok then
		return
	end

	local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
	if not ok then
		return
	end

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	local cmp_select = { behavior = cmp.SelectBehavior.Select }

	cmp.setup({
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		sources = {
			{
				-- path completion
				name = "path",
				options = {
					trailing_slash = true,
				},
			},
			{
				-- disable `[LSP] Text` completions
				name = "nvim_lsp",
				entry_filter = function(entry, ctx)
					return cmp.lsp.CompletionItemKind.Text ~= entry:get_kind()
				end,
			},
			{ name = "crates" },
		},

		completion = {
			completeopt = "menu,menuone,noinsert",
		},

		mapping = {
			["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
			["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
		},

		-- dap integration
		enabled = function()
			return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
		end,
	})

	-- dap integration
	cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
		sources = {
			{ name = "dap" },
		},
	})

	vim.keymap.set("i", "<C-Space>", function()
		cmp.complete()
	end, { expr = true })

	vim.keymap.set("i", "<C-u>", function()
		cmp.scroll_docs(4)
	end, { expr = true })

	vim.keymap.set("i", "<C-d>", function()
		cmp.scroll_docs(-4)
	end, { expr = true })
end

return M
