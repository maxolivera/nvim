vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fmd", vim.lsp.buf.format)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "<right>", ":bn<cr>")
vim.keymap.set("n", "<left>", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- better way to jump to start or end of line
vim.keymap.set('', 'H', '_')
vim.keymap.set('', 'L', '$')

-- terminal maps
vim.keymap.set('n', '<leader>t', ':tab term<cr>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
