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
        "simrat39/rust-tools.nvim",
        ft = { "rust" },
    },

    -- better escaping shortcuts
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    -- monokai pro
    {
        'loctvl842/monokai-pro.nvim',
        lazy = false,
        config = function(_, opts)
            require('monokai-pro').setup(opts)
            vim.cmd('colorscheme monokai-pro')
        end
    }
}

return M
