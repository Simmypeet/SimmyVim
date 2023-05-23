local M = {
    { '<leader>tf', '<CMD>ToggleTerm direction=float<CR>',              desc = "Toggle floating terminal" },
    { '<leader>th', '<CMD>ToggleTerm size=10 direction=horizontal<CR>', desc = "Toggle horizontal terminal" },
    { '<leader>tv', '<CMD>ToggleTerm size=80 direction=vertical<CR>',   desc = "Toggle vertical terminal" },
    { '<F7>',       '<CMD>ToggleTerm direction=float<CR>',              desc = "Toggle floating terminal" },
}

return M
