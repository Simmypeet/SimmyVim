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

    -- rust-tools
    {
        "simrat39/rust-tools.nvim",
        ft = { "rust" },
    },

    -- catppuccin color theme
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        version = '1.1.x',
        lazy = false,
        opts = require('custom.plugins.opts.catppuccin'),
        config = require('custom.plugins.config.catppuccin')
    },

    -- monokai pro
    {
        "loctvl842/monokai-pro.nvim",
        lazy = false,
        opts = require('custom.plugins.opts.monokai-pro'),
        config = require('custom.plugins.config.monokai-pro')
    },

    -- discord rich presence
    {
        'andweeb/presence.nvim',
        lazy = false,
    },

    {
        'navarasu/onedark.nvim',
        lazy = false,
    }
}

return M
