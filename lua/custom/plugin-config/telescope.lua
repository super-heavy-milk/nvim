-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(
        require('telescope.themes').get_dropdown {
            winblend = 0,
            previewer = true,
        }
    )
end, { desc = '[/] Fuzzily search in current buffer' })

-- Symbol prefix
-- vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find,
--   { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set(
    'n',
    '<leader>?',
    require('telescope.builtin').help_tags,
    { desc = '[?] Search Help' }
)

-- [S]earch prefix
vim.keymap.set(
    'n',
    '<leader>sgf',
    require('telescope.builtin').git_files,
    { desc = '[S]earch [G]it [F]iles' }
)
vim.keymap.set(
    'n',
    '<leader>sgs',
    require('telescope.builtin').git_status,
    { desc = '[S]earch [G]it [S]tatus' }
)
vim.keymap.set(
    'n',
    '<leader>sgc',
    require('telescope.builtin').git_commits,
    { desc = '[S]earch [G]it [C]ommits' }
)
vim.keymap.set(
    'n',
    '<leader>sw',
    require('telescope.builtin').grep_string,
    { desc = '[S]earch Current [W]ord' }
)
vim.keymap.set(
    'n',
    '<leader>ss',
    require('telescope.builtin').live_grep,
    { desc = '[S]earch By Grep' }
)
vim.keymap.set(
    'n',
    '<leader>sd',
    require('telescope.builtin').diagnostics,
    { desc = '[S]earch [D]iagnostics' }
)

-- [F]ind prefix
vim.keymap.set(
    'n',
    '<leader>fb',
    require('telescope.builtin').buffers,
    { desc = '[F]ind Existing [B]uffers' }
)
vim.keymap.set(
    'n',
    '<leader>fr',
    require('telescope.builtin').oldfiles,
    { desc = '[F]ind [R]ecently Opened Files' }
)
vim.keymap.set(
    'n',
    '<leader>ff',
    require('telescope.builtin').find_files,
    { desc = '[F]ind [F]iles' }
)
