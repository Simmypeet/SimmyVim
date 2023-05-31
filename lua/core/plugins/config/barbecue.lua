local M = function(_, opts)
    require('barbecue').setup(opts)

    local utils = require('core.utils');


    utils.override_hl(
        function()
            -- get highlights from highlight groups
            local normal_float = utils.get_hlgroup("NormalFloat")
            local fg, bg = normal_float.fg, normal_float.bg

            -- return a table of highlights for telescope based on colors gotten from highlight groups
            return {
                barbecue_normal = { fg = fg, bg = bg },
                barbecue_separator = { fg = fg, bg = bg },
            }
        end
    )
end

return M
