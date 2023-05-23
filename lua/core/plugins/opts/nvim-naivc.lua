local M = function()
    local icons = require('core.icons')
    return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        icons = icons.kinds,
    }
end

return M