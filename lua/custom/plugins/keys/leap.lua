local M = {
    {
        '<leader>s',
        function()
            local current_window = vim.fn.win_getid()
            require('leap').leap { target_windows = { current_window } }
        end,
        desc = 'Leap'
    }
}

return M
