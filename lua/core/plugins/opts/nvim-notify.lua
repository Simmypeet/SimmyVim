local M = {
    timeout = 3000,
    fps = 60,
    stages = 'fade',

    max_height = function()
        return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
        return math.floor(vim.o.columns * 0.75)
    end,
    render = "compact",
    background_color = "Visual"
}

return M
