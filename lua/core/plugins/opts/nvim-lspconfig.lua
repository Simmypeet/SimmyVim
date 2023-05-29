local M = {
    -- options for vim.diagnostic.config()
    diagnostics = {
        underline = true,
        update_in_insert = true,
        virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
            -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
            -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
            -- prefix = "icons",
        },
        severity_sort = true
    },

    format_on_save = true,
    semantic_highlighting = false,
}

return M
