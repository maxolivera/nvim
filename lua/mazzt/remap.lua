vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fmd", vim.lsp.buf.format)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "<left>", ":bn<cr>")
vim.keymap.set("n", "<right>", ":bp<cr>")
vim.keymap.set("n", "<leader>bx", ":bd<cr>")

-- better way to jump to start or end of line
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')
