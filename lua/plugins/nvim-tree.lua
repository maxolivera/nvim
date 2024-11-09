return {
	'nvim-tree/nvim-tree.lua',
	version = "*",
	lazy = false,
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		vim.keymap.set("n", "<leader>t", ":NvimTreeFindFileToggle<cr>")
		vim.opt.termguicolors = true
 		vim.g.loaded_netrw = 1
		vim.g.netrwPlugin = 1
		require("nvim-tree").setup({})
	end,
}
