local M = {
    options = {
        separator_style = "slant",
        indicator = {
            style = "underline",
        },
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        diagnostics_indicator = function(count, _, _, _)
            if count > 9 then
                return "+9"
            end
            return tostring(count)
        end,
        offsets = {
            {
                filetype = "neo-tree",
                text = "EXPLORER",
                highlight = "Directory",
                text_align = "left",
                separator = true,
            },
            {
                filetype = 'aerial',
                text = 'SYMBOLS',
                highlight = "Directory",
                text_align = 'left',
                separator = true
            }
        },
        hover = {
            enabled = true,
            delay = 0,
            reveal = { "close" },
        },
    },
}

return M
