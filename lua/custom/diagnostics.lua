-- disable floating virtual text - use <space>le to open local list and jump around
vim.diagnostic.config {
    virtual_text = false,
}

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 500
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
