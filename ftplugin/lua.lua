vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.expandtab = true

vim.keymap.set('n', '<leader>xf', '<cmd>w | source %<CR>', { desc = 'Execute the current file' })
vim.keymap.set('n', '<leader>xl', '<cmd>.lua<CR>', { desc = 'Execute the current line' })
