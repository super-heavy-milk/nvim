
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

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { 'menuone', 'noselect' }

-- Better diff display
vim.opt.diffopt = { 'internal', 'filler', 'closeoff', 'vertical', 'iwhite', 'linematch:60' }

-- buffer thing (default is true)
--vim.o.hidden = true

-- auto save the buffer
-- vim.opt.autowriteall = true

-- spelling; this doesn't work very well
-- vim.opt.spell = true
