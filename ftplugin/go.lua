vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

vim.keymap.set('n', '<leader>x', '<cmd>w | !go run %<CR>', { desc = 'Execute the current file' })
