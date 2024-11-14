return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
		require'nvim-treesitter.configs'.setup {
		  -- A list of parser names, or "all" (the five listed parsers should always be installed)
		  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "rust", "go", "python", "markdown", "sql"},

		  -- Install parsers synchronously (only applied to `ensure_installed`)
		  sync_install = false,

		  -- Automatically install missing parsers when entering buffer
		  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		  auto_install = true,

		  indent = {
			  enable = true
		  },

		  highlight = {
		    enable = true,

		    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		    -- Using this option may slow down your editor, and you may see some duplicate highlights.
		    -- Instead of true it can also be a list of languagesp
		    additional_vim_regex_highlighting = { "latex", "markdown" },
		  },

		  --[[
		  textsubjects = {
			enable = true,
			prev_selection = ',', -- (Optional) keymap to select the previous selection
			keymaps = {
			    ['.'] = 'textsubjects-smart',
			    [';'] = 'textsubjects-container-out',
			    ['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
			},
		    }
		  --]]
		}
	end,
}
