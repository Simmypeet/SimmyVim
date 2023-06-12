local M = {
    {
        '<C-Up>',
        function()
            require('smart-splits').resize_up()
        end,
        desc = 'Resize Up',
    }
    ,
    {
        '<C-Down>',
        function()
            require('smart-splits').resize_down()
        end,
        desc = 'Resize Down',
    }
    ,
    {
        '<C-Left>',
        function()
            require('smart-splits').resize_left()
        end,
        desc = 'Resize Left',
    }
    ,
    {
        '<C-Right>',
        function()
            require('smart-splits').resize_right()
        end,
        desc = 'Resize Right',
    }
}

return M
