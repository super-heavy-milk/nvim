return {
    -- https://www.josean.com/posts/neovim-linting-and-formatting
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local conform = require 'conform'
        conform.setup {
            -- this doesn't work, but leaving for posterity
            -- formatters = {
            --   prettier = {
            --     prepend_args = { "--plugin", "prettier-plugin-java" }
            --   }
            -- },
            formatters_by_ft = {
                bash = { 'shfmt' },
                css = { 'prettier' },
                graphql = { 'prettier' },
                go = { 'golines', 'gofumpt', 'goimports' },
                html = { 'prettier' },
                java = { 'prettier' },
                javascript = { 'prettier' },
                javascriptreact = { 'prettier' },
                json = { 'prettier' },
                lua = { 'stylua' },
                markdown = { 'prettier' },
                python = { 'ruff_format' },
                sh = { 'shfmt' },
                svelte = { 'prettier' },
                typescript = { 'prettier' },
                typescriptreact = { 'prettier' },
                yaml = { 'prettier' },
            },
            -- format_on_save = {
            --   lsp_fallback = true,
            --   async = false,
            --   timeout_ms = 500,
            -- },
        }

        vim.keymap.set({ 'n', 'v' }, '<leader>rf', function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 2000,
            }, function(err, did_edit)
                local bufname = vim.fs.basename(vim.api.nvim_buf_get_name(0))
                if err then
                    vim.notify(
                        "Error formatting buffer '" .. bufname .. "' '" .. err .. "'",
                        vim.log.levels.ERROR
                    )
                    -- todo: send the error to the local quickfix list
                    return
                end

                if not did_edit then
                    vim.notify("Buffer '" .. bufname .. "' is already formatted correctly")
                    return
                end

                local mode = vim.api.nvim_get_mode().mode
                local is_visual = mode == 'v' or mode == 'V' or mode == '\22'

                -- todo: this works, but you can't see it due to the statusline saying "VISUAL"
                if is_visual then
                    vim.notify("Formatted range in buffer '" .. bufname .. "'")
                    return
                end

                vim.notify("Formatted buffer '" .. bufname .. "'")
            end)
        end, { desc = 'Format buffer or range (in visual mode)' })
    end,
}
