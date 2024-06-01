local utils = require 'custom.utils'

-- set colorscheme here
vim.cmd.colorscheme 'rose-pine-moon'
-- vim.cmd.colorscheme 'darcula-solid'
-- vim.cmd.colorscheme 'github_dark'
-- vim.cmd.colorscheme 'gruvbox'

-- hack to make background transparent
if vim.g.colors_name == 'darcula-solid' then
    vim.cmd 'highligh Normal ctermbg=none'
    vim.cmd 'highlight Normal guibg=none'
    vim.cmd 'highlight NonText ctermbg=none'
end

-- Show a couple lines above and below the cursor when jumping around
vim.o.scrolloff = 5

-- https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
vim.o.termguicolors = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- show a vertical guide rail
vim.opt.colorcolumn = '100'

-- https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { 'menuone', 'noselect' }

-- Better diff display
vim.opt.diffopt = { 'internal', 'filler', 'closeoff', 'vertical', 'iwhite', 'linematch:60' }

-- spellchecking
vim.opt.spell = true

-- buffer thing (default is true)
--vim.o.hidden = true

if utils.is_personal_project then
    vim.notify '  AutoSave Enabled'
    vim.opt.autowriteall = true
end

-- vim.notify('set options from options.lua')
