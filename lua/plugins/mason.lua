return {
	"neovim/nvim-lspconfig",	
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
	},

	config = function()
		local masonlsp = require("mason-lspconfig")
		require("mason").setup()
		masonlsp.setup({
			ensure_installed = {
				"lua_ls",
				"pylsp",
				"rust_analyzer",
			},
		})

		local handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup {}
			end,
		}

		masonlsp.setup_handlers(handlers)
		-- lsp.setup(
	end,
}
