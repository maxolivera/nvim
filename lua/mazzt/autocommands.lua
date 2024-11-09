local autocmd = vim.api.nvim_create_autocmd
-- highlight yanked text
autocmd(
	'TextYankPost',
	{
		pattern = '*',
		command = 'silent! lua vim.highlight.on_yank({ timeout = 500 })'
	}
)
-- jump to last edit position on opening file
autocmd(
	'BufReadPost',
	{
		pattern = '*',
		callback = function(ev)
			if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
				-- except for in git commit messages
				-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
				if not vim.fn.expand('%:p'):find('.git', 1, true) then
					vim.cmd('exe "normal! g\'\\""')
				end
			end
		end
	}
)

-- shorter columns in text because it reads better that way
local text = vim.api.nvim_create_augroup('text', { clear = true })
for _, pat in ipairs({ 'text', 'mail', 'gitcommit' }) do
	autocmd('Filetype', {
		pattern = pat,
		group = text,
		command = 'setlocal spell tw=72 colorcolumn=73',
	})
end
--- tex has so much syntax that a little wider is ok
autocmd('Filetype', {
	pattern = 'tex',
	group = text,
	command = 'setlocal spell tw=80 colorcolumn=81',
})
-- wrap on md files
autocmd('Filetype', {
	pattern = 'md',
	group = text,
	command = 'setlocal spell wrap spelllang=en_us',
})

autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('MazzMS', {}),
	callback = function(ev)
		-- Enable conpletion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vom.lsp.omnifunc'

		local map = function(keys, func, desc)
			vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
		end

		-- Buffer local mappings.
		-- See ':help vim.lsp.*' for documentation on any
		local opts = { buffer = ev.buf }
		map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
		map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
		map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementations')
		map('K', vim.lsp.buf.declaration, 'Hover Documentation')
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	end,
})

local CleanOnSave = vim.api.nvim_create_augroup('CleanOnSave', {})
autocmd({ "BufWritePre" }, {
	group = CleanOnSave,
	pattern = "*",
	command = [[%s/\s\+$//e]],
}) -- remove trailing whitespace from all lines before saving a file)

-- Disable folding for SQL
autocmd("FileType", {
	pattern = "sql",
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
	end
})
