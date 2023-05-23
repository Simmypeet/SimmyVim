local M = {
    {
        "<leader>un",
        function() require("notify").dismiss({ silent = true, pending = true }) end,
        desc = "Dismiss all Notifications",
    }
}

return M
