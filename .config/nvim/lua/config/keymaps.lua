vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "Remove search highlights" })

vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Better Down", expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Better Up", expr = true, silent = true })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = "Keep cursor at begining" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "<C-j>", vim.cmd.cnext, { desc = "GoTo next quickfix" })
vim.keymap.set("n", "<C-k>", vim.cmd.cprev, { desc = "GoTo previous quickfix" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor at center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor at center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Keep cursor at center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep cursor at center" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Better yank" })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>pv', vim.cmd.Oil)
