vim.g.mapleader = " "
vim.g.maplocalleader = " "
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
--[[
vim.keymap.set('n', '<leader>t', ':tab term<cr>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
--]]

-- clear highlight
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- ignore capitalization mistakes
vim.cmd("ca W w")
vim.cmd("ca Q q")
vim.cmd("ca WQ wq")
vim.cmd("ca Wq wq")

-- diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" } )
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" } )
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror message" } )
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" } )

-- checkbox
vim.keymap.set('n', '<leader>ty', [[:s/\[\s\]/[x]/<cr>]], { silent = true })
vim.keymap.set('n', '<leader>tu', [[:s/\[x\]/[ ]/<cr>]], { silent = true })
