local u = require 'custom.utils'

vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

-- vim.keymap.set('n', '<leader>x', '<cmd>w | !go run %<CR>', { desc = 'Execute the current file' })

vim.keymap.set('n', '<leader>x', function()
    local cur_file = vim.api.nvim_buf_get_name(0)

    local root = u.get_project_root_dir()
    if not root then
        vim.notify('Unable to find project root from ' .. cur_file, vim.log.levels.WARN)
        return
    end

    local main = vim.fs.find({ 'main.go' }, {
        upward = false,
        path = root, -- downwards from project root
        type = 'file',
        limit = 1, -- only care about first result, stop searching when found
    })[1]
    if not main or main == '' then
        vim.notify("Unable to recursively find 'main.go' in " .. root, vim.log.levels.WARN)
        return
    end

    -- vim.notify(vim.inspect(vim.api.nvim_parse_cmd('!go run ' .. main, {})))

    vim.cmd.write '%'
    vim.cmd { cmd = '!', args = { 'go', 'run', main } }
    vim.notify('󰨄 Executed ' .. main)
end, { desc = "Execute the project's main.go file" })
