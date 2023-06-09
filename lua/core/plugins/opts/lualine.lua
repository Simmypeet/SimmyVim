local M = function()
    local util = require('core.utils')

    -- refresh lualine
    vim.cmd([[
       augroup lualine_augroup
          autocmd!
           autocmd User LspProgressStatusUpdated lua require("lualine").refresh()
       augroup END
    ]])

    return {
        options = {
            theme = "auto",
            globalstatus = true,
            disabled_filetypes = { statusline = { "dashboard", "alpha" } },
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = {
                {
                    "diagnostics",
                    symbols = {
                        error = " ",
                        warn = " ",
                        info = " ",
                        hint = " ",
                    },
                },
                {
                    "filetype",
                    icon_only = true,
                    separator = "",
                    padding = {
                        left = 1, right = 0 }
                },
                { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            },
            lualine_x = {
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = util.fg("Special")
                },
                {
                    "diff",
                    symbols = {
                        added = "  ",
                        modified = "  ",
                        removed = "  ",
                    },
                },
            },
            lualine_y = {
                require("lsp-progress").progress,
            },
            lualine_z = {
                function()
                    local current_dir = vim.fn.expand("%:p:h")
                    return "  ~ " .. current_dir .. " "
                end,
            },
        },
        extensions = { "neo-tree", "lazy" },
    }
end

return M
