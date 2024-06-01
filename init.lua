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
--    `:help lazy.nvim.txt` for more info
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

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
    -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
    --       These are some example plugins that I've included in the kickstart repository.
    --       Uncomment any of the lines below to enable them.
    -- require 'kickstart.plugins.autoformat',
    -- require 'kickstart.plugins.debug',

    -- NOTE: The import below can automatically add your own plugins, configuration,
    --       etc from `lua/custom/plugins/*.lua`
    --    You can use this folder to prevent any conflicts with this init.lua if you're interested
    --    in keeping up-to-date with whatever is in the kickstart repo.
    --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to begin.
    --    For more information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins

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
