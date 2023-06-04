-- This file is automatically loaded by lazyvim.config.init

local autogroup = require('core.utils').autogroup

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = autogroup("checktime"),
    command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = autogroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = autogroup("resize_splits"),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = autogroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- stop the current LSP server when changing the CWD
vim.api.nvim_create_autocmd("DirChanged", {
    group = autogroup("stop_lsp"),
    callback = function()
        -- clear diagnostics
        vim.diagnostic.reset()
        vim.lsp.stop_client(vim.lsp.get_active_clients())
    end,
})
