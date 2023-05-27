local M = function(_, opts)
    -- Overriding vim.notify with fancy notify if fancy notify exists
    local notify = require("notify")
    vim.notify = notify
    notify.setup(opts)
end

return M
