local u = require 'custom.utils'

-- -- toggle netrw
-- vim.keymap.set('n', '<leader>e', '<cmd>Lexplore<CR>', { desc = '[E]xplore Files (Toggle)' })

local toggle_netrw = function()
    -- @type boolean stateful, tracks if a netrw split has been opened
    local toggled = false

    -- @type integer stateful, tracks the buffer handle of the opened netrw split
    local toggled_netrw_buf_num = -1

    return function()
        vim.notify '--------------------------------------'

        -- early return: toggle should short circuit if only netrw is open
        if vim.bo.ft == 'netrw' and #vim.api.nvim_list_wins() == 1 then
            vim.notify('Must have more than one window open to toggle Netrw', vim.log.levels.WARN)
            return
        end

        -- early return: if already toggled open, use the stored state to delete the open buffer
        vim.notify( 'toggled: ' .. tostring(toggled) .. ' toggled_id: ' .. tostring(toggled_netrw_buf_num))
        if toggled and toggled_netrw_buf_num ~= -1 then
            toggled = false
            vim.api.nvim_buf_delete(toggled_netrw_buf_num, {})
            return
        end

        -- vim.notify(vim.inspect(vim.api.nvim_win_get_config(vim.api.nvim_get_current_win())))
        -- vim.notify(vim.inspect(vim.api.nvim_list_bufs()))

        -- the buffer from which the cmd is launched
        local cmd_buf = vim.api.nvim_buf_get_name(0)

        local cmd_buf_parent_dir_path = vim.fs.dirname(cmd_buf)
        -- [:h] 'head' (last dir, no, trailing slash)
        -- local cmd_buf_parent_dir_path = vim.fn.expand '%:h'
        vim.notify('cmd_buf: ' .. cmd_buf)
        vim.notify('cmd_buf_parent_dir_path: ' .. cmd_buf_parent_dir_path)

        -- set last search as file name, so it is highlighted/focused upon netrw open
        vim.cmd [[:let @/=expand("%:t")]] -- [:t] 'tail' (last file), no path

        -- open netrw in left split
        vim.cmd('Lexplore ' .. cmd_buf_parent_dir_path)

        -------------------------
        -- AFTER OPENING NETRW --
        -------------------------

        -- set toggled_id
        toggled_netrw_buf_num = vim.api.nvim_get_current_buf()
        vim.notify( 'toggled_id: ' .. toggled_netrw_buf_num .. ' name: ' .. vim.api.nvim_buf_get_name(toggled_netrw_buf_num))

        -- expand the tree upwards for every parent directory til root is reached
        local root = u.get_project_root_dir() or vim.fn.getcwd()
        for dir in vim.fs.parents(cmd_buf) do
            vim.notify('dir: ' .. dir .. '\troot: ' .. root)
            if dir == root then
                vim.notify 'found root'
                break
            end
            vim.cmd "call netrw#Call('NetrwBrowseUpDir', 1)"
        end

        -- this will go to the last search, which was set above, and zz will center
        vim.cmd ':normal n<CR>zz'

        -- set toggle to true, so that upon next invocation of cmd, the netrw buf is deleted
        toggled = true
    end
end

-- netrw
vim.g.netrw_winsize = 25 -- 25% vertical split
vim.g.netrw_liststyle = 3 -- use tree mode by default
local toggler = toggle_netrw()

vim.keymap.set('n', '<leader>e', toggler, { desc = 'Toggle netrw' })
