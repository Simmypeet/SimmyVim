local M = {
    -- github copilot
    {
        "zbirenbaum/copilot.lua",
        event = { 'InsertEnter' },
        opts = require('custom.plugins.opts.copilot'),
        config = require('custom.plugins.config.copilot')
    },

    -- better escaping shortcuts
    {
        "max397574/better-escape.nvim",
        event = 'InsertEnter',
        config = function()
            require("better_escape").setup()
        end,
    },

    -- monokai pro
    {
        'loctvl842/monokai-pro.nvim',
        lazy = false,
        opts = require('custom.plugins.opts.monokai-pro'),
        config = require('custom.plugins.config.monokai-pro'),
    },

    -- catppuccin color theme
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        opts = require('custom.plugins.opts.catppuccin'),
        config = require('custom.plugins.config.catppuccin')
    },

    -- gruvbox material
    {
        'sainnhe/gruvbox-material',
        name = 'gruvbox-material',
        lazy = false,
    },
}

return M
