return {
    'tpope/vim-fugitive',
    config = function()
        -- https://jeancharles.quillet.org/posts/2022-03-02-Practical-introduction-to-fugitive.html
        vim.api.nvim_create_user_command(
            'GitFileHistory',
            '0Gllog',
            { desc = 'browse Git history for a file' }
        )
    end,
}
