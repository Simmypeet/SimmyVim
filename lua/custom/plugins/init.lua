local M = {
    -- github copilot
    {
        "zbirenbaum/copilot.lua",
        event = { 'InsertEnter' },
        opts = require('custom.plugins.opts.copilot'),
        config = require('custom.plugins.config.copilot')
    },

    -- rust-tools
    {
        'simrat39/rust-tools.nvim',
        ft = { 'rust' },
    },

    -- better escaping shortcuts
    {
        "max397574/better-escape.nvim",
        event = 'InsertEnter',
        config = function()
            require("better_escape").setup()
        end,
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

    -- leap
    {
        "ggandor/leap.nvim",
        dependencies = { 'tpope/vim-repeat' },
        keys = require('custom.plugins.keys.leap'),
    },

    {
        'sam4llis/nvim-tundra',
        lazy = false,
        opts = require('custom.plugins.opts.nvim-tundra'),
        config = require('custom.plugins.config.nvim-tundra')
    },

    {
        'tiagovla/tokyodark.nvim',
        lazy = false,
    },

    {
        'EdenEast/nightfox.nvim',
        lazy = false,
    },

    --[[
    {
        'andweeb/presence.nvim',
        lazy = false,
        opts = require('custom.plugins.opts.presence'),
        config = require('custom.plugins.config.presence'),
        cond = function()
            return false
        end
    },
    ]] --

    {
        'navarasu/onedark.nvim',
        lazy = false,
    },

    {
        'folke/tokyonight.nvim',
        lazy = false
    },

    {
        'Mofiqul/vscode.nvim',
        lazy = false,
    },

    {
        "loctvl842/monokai-pro.nvim",
        lazy = false,
    },

    {
        "projekt0n/github-nvim-theme",
        lazy = false,
    },

    {
        "Civitasv/cmake-tools.nvim",
        ft = { "cmake", "cpp", "cuda", "c", "objc", "objcpp" },
        config = require('custom.plugins.config.cmake-tools'),
    }
}

return M
