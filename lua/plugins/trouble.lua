return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>dx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>dc",
			"<cmd>Trouble diangostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>dL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
	config = function()
		local trouble = require("trouble")

		trouble.setup({})

		vim.keymap.set("n", "<leader>tt", function() trouble.toggle() end)

		vim.keymap.set("n", "<leader>tn", function()
			trouble.next({ skip_groups = true, jump = true })
		end)

		vim.keymap.set("n", "<leader>tp", function()
			trouble.previous({ skip_groups = true, jump = true })
		end)
	end,
}
