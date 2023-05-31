local M = function(_, opts)
    local telescope = require('telescope')

    telescope.setup(opts)

    local utils = require('core.utils')

    utils.set_hl(
        function()
            -- get highlights from highlight groups
            local normal_float = utils.get_hlgroup("NormalFloat")
            local fg, bg = normal_float.fg, normal_float.bg

            local bg_alt = utils.get_hlgroup("Visual").bg
            local green = utils.get_hlgroup("String").fg
            local red = utils.get_hlgroup("Error").fg

            -- return a table of highlights for telescope based on colors gotten from highlight groups
            return {
                TelescopeBorder = { fg = bg_alt, bg = bg },
                TelescopeNormal = { bg = bg },
                TelescopePreviewBorder = { fg = bg, bg = bg },
                TelescopePreviewNormal = { bg = bg },
                TelescopePreviewTitle = { fg = bg, bg = green },
                TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
                TelescopePromptNormal = { fg = fg, bg = bg_alt },
                TelescopePromptPrefix = { bg = bg_alt },
                TelescopePromptTitle = { fg = bg, bg = red },
                TelescopeResultsBorder = { fg = bg, bg = bg },
                TelescopeResultsNormal = { bg = bg },
                TelescopeResultsTitle = { fg = bg, bg = bg },
            }
        end
    )
end

return M
