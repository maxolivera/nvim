return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		require("fidget").setup({})
		local masonlsp = require("mason-lspconfig")
		require("mason").setup()
		masonlsp.setup({
			ensure_installed = {
				"ts_ls",
				"lua_ls",
				"gopls",
				"basedpyright",
				"rust_analyzer",
				"ruff",
				"clangd",
				"astro",
			},
		})

		local lsp = require("lspconfig")

		local handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup {}
			end,

			["lua_ls"] = function()
				lsp.lua_ls.setup {
					settings = {
						Lua = { diagnostics = { globals = { "vim" } } }
					}
				}
			end,
			["gopls"] = function()
				local util = require "lspconfig/util"
				lsp.gopls.setup {
					cmd = { "gopls" },
					filetypes = { "go", "gomod", "gowork", "gotmpl" },
					root_dir = util.root_pattern("go.work", "go.mod", ".git"),
					setting = {
						gopls = {
							analyses = {
								unusedparams = true,
							},
							usePlaceholders = true,
							staticcheck = true,
							gofumpt = true,
						},
					},
					["ui.diagnostic.staticcheck"] = true
				}
			end,
		}

		masonlsp.setup_handlers(handlers)

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }, -- For luasnip users.
			}, {
				{ name = 'buffer' },
			})
		})

		vim.diagnostic.config({
			update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
			virtual_text = true,
		})
	end,
}
