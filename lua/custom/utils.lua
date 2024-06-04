local M = {}

-- Get the nearest project root path e.g. '/Users/tylerlawton/repos/project'.
-- This only searches up to the $HOME dir (non-inclusive).
-- Returns nil if no root is found.
--
-- @return string|nil
M.get_project_root_dir = function()
    local root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', '.editorconfig' }, {
        upward = true,
        stop = vim.loop.os_homedir(), -- non-inclusive, at home dir
        limit = 1, -- only care about first result, stop searching when found
    })[1])
    -- vim.notify("root_dir: " .. root_dir)
    return root_dir
end

-- Some settings I only want enabled in a "personal project"
--
-- @return boolean
M.is_personal_project = function()
    local root_dir = M.get_project_root_dir()
    local project_dirs = {
        'tylerlawton/repos',
        'tylerlawton/.config/nvim',
    }

    for _, proj in ipairs(project_dirs) do
        if root_dir.find(root_dir, proj, 1, true) then
            return true
        end
    end

    return false
end


M.get_project_justfile = function()
    local cur_file = vim.api.nvim_buf_get_name(0)

    local root = M.get_project_root_dir()
    if not root then
        vim.notify('Unable to find project root from ' .. cur_file, vim.log.levels.WARN)
        return nil
    end

    local justfile = vim.fs.find({ 'justfile' }, {
        upward = false,
        path = root, -- downwards from project root
        type = 'file',
        limit = 1, -- only care about first result, stop searching when found
    })[1]
    if not justfile or justfile == '' then
        vim.notify("Unable to recursively find 'justfile' in " .. root, vim.log.levels.WARN)
        return nil
    end

    return justfile
end

return M
