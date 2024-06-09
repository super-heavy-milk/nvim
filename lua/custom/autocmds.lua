-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- set some options for "textual" files to enhance readability
local spellGroup = vim.api.nvim_create_augroup('spell_files', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    pattern = { '*.md, *.txt' },
    group = spellGroup,
    command = 'setlocal spell wrap linebreak',
    -- this is nice, but will mess with copy/paste
    --command = "setlocal spell wrap linebreak autoindent formatoptions=tacqw textwidth=80 wrapmargin=0",
})

local markdownGroup = vim.api.nvim_create_augroup('markdown_files', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    pattern = { '*.md' },
    group = markdownGroup,
    command = 'setlocal conceallevel=2',
    -- this is nice, but will mess with copy/paste
    --command = "setlocal spell wrap linebreak autoindent formatoptions=tacqw textwidth=80 wrapmargin=0",
})

local term_group = vim.api.nvim_create_augroup('term_group', { clear = true })
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    group = term_group,
    callback = function()
        -- make escape work in the terminal properly
        vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true })

        -- terminal mode seems to only partially respect this?
        vim.opt_local.guicursor = {
            'n-v-c:block', -- normal, visual, cmd-line normal
            'i-ci-ve:ver10', -- insert, cmd-line insert, visual selection
            'r-cr:hor20', -- replace, cmd-line replace
            'o:hor50', -- operator-pending
            'a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor', -- all modes
            'sm:block-blinkwait175-blinkoff150-blinkon175', -- show-match in insert mode
        }

        vim.opt_local.spell = false
        vim.opt_local.number = false
        vim.cmd.startinsert()
    end,
})
