local M = {
    { '<leader>ff', function() require('telescope.builtin').find_files() end,  desc = 'Find files' },
    { '<leader>ft', function() require('telescope.builtin').colorscheme() end, desc = 'Find themes' },
    { '<leader>fw', function() require('telescope.builtin').live_grep() end,   desc = 'Find words (grep)' },
    { '<leader>fb', function() require('telescope.builtin').buffers() end,     desc = 'Find buffers' },
    {
        '<leader>fs',
        function()
            require('telescope.builtin').find_files({
                prompt_title = ' Config Files',
                cwd = vim.fn.stdpath "config",
            })
        end,
        desc = 'Find config files'
    }
}

return M
