return {
	"tinted-theming/tinted-vim",
	priority = 1000, -- Load first, as before
	config = function()
		vim.cmd([[colorscheme base16-gruvbox-dark-hard]]) -- Replace with your chosen theme
		vim.o.background = 'dark' -- Or 'light' if your chosen theme is light
	end,
}

