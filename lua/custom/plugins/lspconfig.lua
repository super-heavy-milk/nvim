return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        -- https://github.com/williamboman/mason.nvim
        {
            'williamboman/mason.nvim',
            config = true,
            PATH = 'prepend',
        },

        -- Paired with the LSP above
        -- https://github.com/williamboman/mason-lspconfig.nvim
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP (spinning thing in right lower corner)
        -- https://github.com/j-hui/fidget.nvim
        {
            'j-hui/fidget.nvim',
            tag = 'legacy',
            opts = {}, -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        },

        -- Additional lua configuration, makes nvim stuff amazing!
        -- https://github.com/folke/neodev.nvim
        { 'folke/neodev.nvim', opts = {} },
    },
}
