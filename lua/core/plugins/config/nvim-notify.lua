local M = function()
    -- Overriding vim.notify with fancy notify if fancy notify exists
    local notify = require("notify")
    vim.notify = notify
    notify.setup()
end

return M
