return {
    -- markdown motions and some basic italics
    {
        'tadmccorkle/markdown.nvim',
        ft = 'markdown', -- or 'event = "VeryLazy"'
        opts = {
            -- configuration here or empty for defaults
        },
    },

    -- better display of markdown within the editor
    {
        'lukas-reineke/headlines.nvim',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        -- config = true,   -- or `opts = {}`
        opts = {
            markdown = {
                bullets = {},
                codeblock_highlight = '',
            },
        },
    },
}
