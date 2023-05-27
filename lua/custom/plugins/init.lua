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

    -- lsp signature
    {
        'ray-x/lsp_signature.nvim',
        evnt = "InsertEnter",
        config = function()
            require('lsp_signature').setup()
        end
    },
}

return M
