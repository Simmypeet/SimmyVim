local M = function(_, opts)
    require('nvim-tree').setup(opts)

    local utils = require('core.utils')
    utils.set_hl(function()
        local visual = utils.get_hlgroup('Visual')
        return {
            ['NvimTreeIndentMarker'] = {
                fg = visual.bg,
            }
        }
    end)
end

return M
