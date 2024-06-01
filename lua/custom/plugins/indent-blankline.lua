return {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
        -- indent = {
        --   highlight = { "CursorColumn", "Whitespace" },
        --   char = "",
        -- },
        -- whitespace = {
        --   highlight = { "CursorColumn", "Whitespace" },
        --   remove_blankline_trail = false,
        -- },
        scope = {
            enabled = true,
            char = '┋',
        },
        --viewport_buffer = { min = 100 }
    },
}
