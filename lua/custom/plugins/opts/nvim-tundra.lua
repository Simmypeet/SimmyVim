local M = function()
    local colors = require('nvim-tundra.palette.arctic')
    return {
        transparent_background = false,
        dim_inactive_windows = {
            enabled = true,
            color = nil,
        },
        sidebars = {
            enabled = false,
            color = nil,
        },
        editor = {
            search = {},
            substitute = {},
        },
        syntax = {
            booleans = { bold = true, italic = true },
            comments = { bold = true, italic = true },
            conditionals = {},
            constants = { bold = true },
            fields = {},
            functions = {},
            keywords = {},
            loops = {},
            numbers = { bold = true },
            operators = { bold = true },
            punctuation = {},
            strings = {},
            types = { italic = true },
        },
        diagnostics = {
            errors = {},
            warnings = {},
            information = {},
            hints = {},
        },
        plugins = {
            lsp = true,
            treesitter = true,
            telescope = true,
            nvimtree = true,
            cmp = true,
            context = true,
            dbui = true,
            gitsigns = true,
            neogit = true,
        },
        overwrite = {
            colors = {},
            highlights = {
                ['WinSeparator'] = {
                    bg = colors.gray._950,
                    fg = colors.gray._1000,
                }
            },
        },
    }
end

return M
