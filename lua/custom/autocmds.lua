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
local spell_group = vim.api.nvim_create_augroup('spell_files', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.md, *.txt' },
  group = spell_group,
  command = 'setlocal spell wrap linebreak',
  -- this is nice, but will mess with copy/paste
  --command = "setlocal spell wrap linebreak autoindent formatoptions=tacqw textwidth=80 wrapmargin=0",
})

local md_group = vim.api.nvim_create_augroup('markdown_files', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.md' },
  group = md_group,
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

-- From vim defaults.vim
-- ---
-- When editing a file, always jump to the last known cursor position.
-- Don't do it when the position is invalid, when inside an event handler
-- (happens when dropping a file on gvim) and for a commit message (it's
-- likely a different one than last time).
local last_pos_group = vim.api.nvim_create_augroup('last_pos_group', { clear = true })
vim.api.nvim_create_autocmd('BufReadPost', {
  group = last_pos_group,
  callback = function(args)
    local valid_line = vim.fn.line [['"]] >= 1 and vim.fn.line [['"]] < vim.fn.line '$'
    local not_commit = vim.b[args.buf].filetype ~= 'commit'
    if valid_line and not_commit then
      vim.cmd [[normal! g`"]]
    end
  end,
})
