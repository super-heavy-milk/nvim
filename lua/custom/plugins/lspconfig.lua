return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        {
            'williamboman/mason.nvim',
            config = true,
            PATH = 'prepend',
        },

        -- Paired with the LSP above
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        {
            'j-hui/fidget.nvim',
            tag = 'legacy',
            opts = {}, -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        },

        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
    },
}
