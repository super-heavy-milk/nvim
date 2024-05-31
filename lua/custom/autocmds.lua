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
