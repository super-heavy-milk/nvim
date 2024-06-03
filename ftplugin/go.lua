local u = require 'custom.utils'

vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

-- vim.keymap.set('n', '<leader>x', '<cmd>w | !go run %<CR>', { desc = 'Execute the current file' })

vim.keymap.set('n', '<leader>x', function()
    local cur_file = vim.api.nvim_buf_get_name(0)

    local root = u.get_project_root_dir()
    if not root then
        vim.notify('Unable to find project root for ' .. cur_file, vim.log.levels.WARN)
        return
    end

    local main = vim.fn.findfile('main.go', root)
    if main == '' then
        vim.notify('Unable to find main.go relative to ' .. cur_file, vim.log.levels.WARN)
        return
    end

    vim.cmd.write '%'
    vim.cmd { cmd = '!', args = { 'go', 'run', main } }
    vim.notify('Executed ' .. main .. ' in ' .. root)
end, { desc = "Execute the project's main.go file" })
