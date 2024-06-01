------------------------------------------------------
-- This file is for non-plugin specific keybindings --
------------------------------------------------------

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set(
    'n',
    '<leader>se',
    vim.diagnostic.open_float,
    { desc = '[S]how floating diagnostic message' }
)
vim.keymap.set(
    'n',
    '<leader>le',
    vim.diagnostic.setloclist,
    { desc = 'Open diagnostics in [L]ocalList' }
)

-- disable floating virtual text - use <space>le to open local list and jump around
vim.diagnostic.config {
    virtual_text = false,
}

-- toggle netrw
vim.keymap.set('n', '<leader>e', '<cmd>Lexplore<CR>', { desc = '[E]xplore Files (Toggle)' })

-- make escape work in the terminal properly
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true })

-- vim.keymap.set({ 'n', 't' }, '<M-H>', '<C-W>h', { desc = 'Alt-h for Window Left' })
-- vim.keymap.set({ 'n', 't' }, '<M-J>', '<C-W>j', { desc = 'Alt-j for Window Down' })
-- vim.keymap.set({ 'n', 't' }, '<M-K>', '<C-W>k', { desc = 'Alt-k for Window Up' })
-- vim.keymap.set({ 'n', 't' }, '<M-L>', '<C-W>l', { desc = 'Alt-l for Window Right' })
