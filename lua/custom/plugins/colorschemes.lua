return {

    -- darcula solid
    -- https://github.com/santos-gabriel-dario/darcula-solid.nvim
    {
        'briones-gabriel/darcula-solid.nvim',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        dependencies = {
            'rktjmp/lush.nvim',
        },
        config = function()
            -- vim.cmd.colorscheme 'darcula-solid'
            -- -- below lines make the background inherit the terminal background
            vim.cmd 'hi Normal ctermbg=none'
            vim.cmd 'highlight NonText ctermbg=none'
            vim.cmd 'hi Normal guibg=none'
        end,
    },

    -- rose-pine
    -- https://github.com/rose-pine/neovim
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup {
                dim_inactive_windows = true,
                styles = {
                    transparency = true,
                },
            }
            -- vim.cmd.colorscheme 'rose-pine-moon'
        end,
    },

    -- zenbones
    -- https://github.com/mcchrish/zenbones.nvim
    {
        'mcchrish/zenbones.nvim',
        dependencies = {
            'rktjmp/lush.nvim',
        },
        config = function()
            -- vim.cmd.colorscheme 'zenburned'
            -- vim.cmd.colorscheme 'forestbones'
            -- vim.cmd.colorscheme 'nordbones'
            -- below lines make the background inherit the terminal background
            vim.cmd 'hi Normal ctermbg=none'
            vim.cmd 'highlight NonText ctermbg=none'
            vim.cmd 'hi Normal guibg=none'
        end,
    },
}
