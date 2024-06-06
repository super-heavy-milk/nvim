local u = require 'custom.utils'

-- -- toggle netrw
-- vim.keymap.set('n', '<leader>e', '<cmd>Lexplore<CR>', { desc = '[E]xplore Files (Toggle)' })

local toggle_netrw = function()
    local toggled = false
    local toggled_id = nil
    return function()
        vim.notify '--------------------------------------'
        vim.notify('toggled: ' .. tostring(toggled) .. ' toggled_id: ' .. tostring(toggled_id))
        local cur_win = vim.api.nvim_get_current_win()
        local cur_buf = vim.api.nvim_buf_get_name(0)
        local bufno = vim.api.nvim_win_get_buf(0)

        if toggled and toggled_id ~= nil then
            toggled = false
            vim.notify('toggled: ' .. tostring(toggled) .. ' toggled_id: ' .. tostring(toggled_id))
            vim.notify('toggled is true. closing: ' .. toggled_id)
            vim.api.nvim_buf_delete(toggled_id, {})
            return
        end

        local num_open_wins = #vim.api.nvim_list_wins()
        -- local is_netrw = string.match(vim.api.nvim_buf_get_name(0), 'NetrwTreeListing')
        local is_netrw = vim.bo.ft == 'netrw'
        local ft = vim.api.nvim_win_get_config(vim.api.nvim_get_current_win())
        local root = u.get_project_root_dir() or vim.fn.getcwd()
        -- vim.notify(vim.inspect(vim.api.nvim_win_get_config(vim.api.nvim_get_current_win())))
        vim.notify(vim.inspect(vim.api.nvim_list_bufs()))

        if is_netrw and num_open_wins == 1 then
            vim.notify('Must have more than one window open to toggle Netrw', vim.log.levels.WARN)
            return
        end

        -- netrw is open in a split, so close it (toggle)
        if is_netrw and num_open_wins > 1 then
            vim.cmd.close()
            return
        end

        local relative_path = vim.fn.expand '%:h' -- [:h] 'head' (last dir, no, trailing slash)
        vim.notify('rel: ' .. relative_path)

        -- set last search as file name, so it is highlighted/focused upon netrw open
        vim.cmd [[:let @/=expand("%:t")]] -- [:t] 'tail' (last file)

        -- open netrw in left split
        vim.cmd('Lexplore ' .. relative_path)

        -- set toggled_id AFTER opening netrw
        toggled_id = vim.api.nvim_get_current_buf()
        vim.notify('toggled_id: ' .. toggled_id .. ' name: ' .. vim.api.nvim_buf_get_name(toggled_id))

        -- expand the tree upwards for every parent directory till root is reached
        for dir in vim.fs.parents(cur_buf) do
            vim.notify('dir: ' .. dir .. '\troot: ' .. root)
            if dir == root then
                vim.notify 'found root'
                break
            end
            vim.cmd "call netrw#Call('NetrwBrowseUpDir', 1)"
        end

        -- this will go to the last search, which was set above, and zz will center
        vim.cmd ':normal n<CR>zz'
        toggled = true
    end
end

-- netrw
vim.g.netrw_winsize = 25 -- 25% vertical split
vim.g.netrw_liststyle = 3 -- use tree mode by default
local toggler = toggle_netrw()

vim.keymap.set('n', '<leader>e', toggler, { desc = 'Toggle netrw' })
