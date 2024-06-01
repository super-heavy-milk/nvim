-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- netrw
--vim.g.netrw_liststyle = 3 -- use tree mode by default
vim.g.netrw_winsize = 25 -- 25% vertical split

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    see `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- For more information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
require('lazy').setup({
    -- NOTE: These are some example plugins from the kickstart repository.
    --       Uncomment any of the lines below to enable them.
    -- require 'kickstart.plugins.autoformat',
    -- require 'kickstart.plugins.debug',

    -- Import all the files (as plugin specs) from the `./lua/custom/plugins` directory
    { import = 'custom.plugins' },
}, {})

-- [[ load global options ]]
require 'custom.options'

-- [[ load autocommands ]]
require 'custom.autocmds'

-- [[ load nvim keymaps ]]
require 'custom.keybinds'

-- [[ load nvim diagnostics settings ]]
require 'custom.diagnostics'

-- [[ load telescope config ]]
require 'custom.plugin-config.telescope'

-- [[ load treesitter config ]]
require 'custom.plugin-config.treesitter'

-- [[ load lsp config ]]
require 'custom.plugin-config.lsp'

-- [[ load nvim-cmp config ]]
require 'custom.plugin-config.cmp'

-- The line beneath this is called `modeline`. See `:help modeline`
-- i've disabled this by removing the 'vim:' prefix thing
-- ts=2 sts=2 sw=2 et
