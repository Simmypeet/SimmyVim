local utils = require("core.utils")
utils.set_hl(function()
    local diretory = utils.get_hlgroup("Directory")

    return {
        ['SimmyBufferLineOffset'] = {
            fg = diretory.fg,
            bg = diretory.bg,
            bold = true
        }
    }
end)

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
                highlight = "SimmyBufferLineOffset",
                text_align = "center",
            },
            {
                filetype = 'aerial',
                text = 'SYMBOLS',
                highlight = "SimmyBufferLineOffset",
                text_align = 'center',
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
