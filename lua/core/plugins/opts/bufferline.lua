local M = {
    options = {
        separator_style = "slant",
        indicator = {
            style = "icon",
        },
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(count, _, _, _)
            if count > 9 then
                return "+9"
            end
            return tostring(count)
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "EXPLORER",
                highlight = "NormalFloat",
                text_align = "center",
                separator = true,
            },
            {
                filetype = 'aerial',
                text = 'SYMBOLS',
                highlight = "NormalFloat",
                text_align = 'center',
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
