local u = require 'custom.utils'

local netrw_toggler = function()
    -- @type boolean - Tracks if a netrw split has been opened.
    local toggled = false

    -- @type integer - Tracks the buffer number of the opened netrw split.
    local toggled_netrw_buf_num = -1

    -- @type integer - Used to hold an autocommand to toggle false upon exiting the netrw buffer.
    local toggler_group = vim.api.nvim_create_augroup('toggler_group', { clear = true })

    return function()
        -------------------
        -- EARLY RETURN  --
        -------------------

        -- toggle should short circuit if only netrw is open
        if vim.bo.ft == 'netrw' and #vim.api.nvim_list_wins() == 1 then
            vim.notify('Must have more than one window open to toggle Netrw', vim.log.levels.WARN)
            return
        end

        -- if already toggled open, use the stored state to delete the open buffer
        if toggled and toggled_netrw_buf_num ~= -1 then
            vim.api.nvim_buf_delete(toggled_netrw_buf_num, {})
            -- because the buffer was deleted,
            -- the 'WinClosed' autocommand defined below will set `toggled=false`
            return
        end

        ---------------------------
        -- BEFORE OPENING NETRW  --
        ---------------------------

        -- @type string - The buffer from which the cmd is launched.
        local cmd_buf = vim.api.nvim_buf_get_name(0)

        -- @type string
        local cmd_buf_parent_dir_path = vim.fs.dirname(cmd_buf) or '.'

        -- set last search as file name, so it is highlighted/focused upon netrw open
        vim.cmd [[:let @/=expand("%:t")]] -- [:t] 'tail' (last file), no path

        -- open netrw in left split
        vim.cmd('Lexplore ' .. cmd_buf_parent_dir_path)

        -------------------------
        -- AFTER OPENING NETRW --
        -------------------------

        -- set the variables captured by the closure
        toggled = true -- so that upon next invocation of `<leader>e`, the netrw buf is deleted
        toggled_netrw_buf_num = vim.api.nvim_get_current_buf()

        -- expand the tree upwards for every parent directory til root is reached
        local root = u.get_project_root_dir() or vim.fn.getcwd()
        for dir in vim.fs.parents(cmd_buf) do
            if dir == root then
                break
            end
            vim.cmd "call netrw#Call('NetrwBrowseUpDir', 1)"
        end

        -- n<CR> will focus/highlight the last search, which was set above
        -- zz will center the buffer
        vim.cmd ':normal n<CR>zz'

        -- handle edge case: quitting netrw with command other than `<leader>e`
        vim.api.nvim_create_autocmd({ 'WinClosed' }, {
            group = toggler_group,
            buffer = toggled_netrw_buf_num, -- pin to the toggled buffer
            once = true, -- delete after firing, needed because of pin
            callback = function()
                toggled = false
            end,
        })
    end
end

-- netrw settings
vim.g.netrw_winsize = 25 -- 25% vertical split
vim.g.netrw_liststyle = 3 -- use tree mode by default

-- this will store the state for the toggling command
local toggler = netrw_toggler()
vim.keymap.set('n', '<leader>e', toggler, { desc = '[E]xpore Files Toggle' })

-- -- toggle netrw
-- vim.keymap.set('n', '<leader>e', '<cmd>Lexplore<CR>', { desc = '[E]xplore Files (Toggle)' })