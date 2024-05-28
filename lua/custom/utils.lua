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

return M
