local M = function(_, opts)
    -- Overriding vim.notify with fancy notify if fancy notify exists
    local notify = require("notify")
    vim.notify = notify
    notify.setup(opts)

    local utils = require('core.utils')
end

return M
