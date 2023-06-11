local M = { -- file explorer
    -- file explorer
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        version = false,
        keys = require('core.plugins.keys.nvim-tree'),
        opts = require('core.plugins.opts.nvim-tree'),
        config = require('core.plugins.config.nvim-tree')
    },

    -- which key
    {
        "folke/which-key.nvim",
        lazy = false,
        version = "^1.4.3",
        config = require('core.plugins.config.which-key')
    },

    -- treesitter syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        version = "^0.9.0",
        event = { 'BufReadPost', 'BufNewFile' },
        opts = require('core.plugins.opts.nvim-treesitter'),
        config = require('core.plugins.config.nvim-treesitter')
    },

    -- lsp-progress
    {
        'linrongbin16/lsp-progress.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        commit = '1cf6b32c27e2288712031ca8a5751529707541bd',
        opts = require('core.plugins.opts.lsp-progress'),
        config = require('core.plugins.config.lsp-progress')
    },

    -- indent guides for Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = require('core.plugins.opts.indent-blankline'),
    },

    -- notification ui
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        version = "^2.20.6",
        keys = require('core.plugins.keys.nvim-notify'),
        opts = require('core.plugins.opts.nvim-notify'),
        config = require('core.plugins.config.nvim-notify')
    },

    -- telescope fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        cmd = { 'Telescope' },
        dependencies = {
            { 'nvim-lua/plenary.nvim', version = "^0.1.3" }
        },
        version = "^0.1.1",
        opts = require('core.plugins.opts.telescope'),
        keys = require('core.plugins.keys.telescope'),
        config = require('core.plugins.config.telescope')
    },

    -- mason lsp
    {
        'williamboman/mason.nvim',
        version = "^1",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        opts = require('core.plugins.opts.mason'),
        config = require('core.plugins.config.mason')
    },

    -- mason lsp config
    {
        'williamboman/mason-lspconfig.nvim',
        version = "^1.1",
        opts = require('core.plugins.opts.mason-lspconfig'),
        config = require('core.plugins.config.mason-lspconfig')
    },

    -- lspconfig
    {
        'neovim/nvim-lspconfig',
        commit = '6b955189e6efb652eb446a2eb42f3eb33b44333e',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'folke/neodev.nvim',
        },
        opts = require('core.plugins.opts.nvim-lspconfig'),
        config = require('core.plugins.config.nvim-lspconfig')
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            'linrongbin16/lsp-progress.nvim'
        },
        commit = '8912bea65de93a56b1f70cdb7c3c26f9cce30394',
        event = "VeryLazy",
        opts = require('core.plugins.opts.lualine'),
    },

    -- lsp symbol navigation for lualine
    {
        "SmiteshP/nvim-navic",
        commit = '15704c607569d6c5cfeab486d3ef9459645a70ce',
        lazy = true,
        init = require('core.plugins.init.nvim-navic'),
        opts = require('core.plugins.opts.nvim-naivc'),
    },

    -- dressing ui
    {
        "stevearc/dressing.nvim",
        lazy = false,
    },

    -- bufferline
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        version = '^4.1.0',
        keys = require('core.plugins.keys.bufferline'),
        opts = require('core.plugins.opts.bufferline'),
    },

    -- buffer remove
    {
        "echasnovski/mini.bufremove",
        version = "^0.9.0",
        lazy = false,
        keys = require('core.plugins.keys.mini-bufremove'),
    },


    -- completion suggestions
    {
        'hrsh7th/nvim-cmp',
        lazy = false,
        commit = '6f118169af14c0f92d3f6062cd6f6b8b12361b3a',
        dependencies = {
            { 'hrsh7th/cmp-buffer',   commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa' },
            { 'hrsh7th/cmp-path',     commit = '91ff86cd9c29299a64f968ebb45846c485725f23', },
            { 'hrsh7th/cmp-nvim-lsp', commit = '78924d1d677b29b3d1fe429864185341724ee5a2' },
            { 'L3MON4D3/LuaSnip',     version = "^1.2.1" },

            -- auto pairs
            {
                "windwp/nvim-autopairs",
                lazy = false,
                opts = require('core.plugins.opts.nvim-autopairs'),
                config = require('core.plugins.config.nvim-autopairs')
            },
        },
        opts = require('core.plugins.opts.nvim-cmp'),
        config = require('core.plugins.config.nvim-cmp')
    },

    -- scroll bar
    {
        'petertriho/nvim-scrollbar',
        commit = '35f99d559041c7c0eff3a41f9093581ceea534e8',
        event = { 'BufRead' },
        opts = require('core.plugins.opts.nvim-scrollbar'),
    },

    -- git
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufRead' },
        version = "^0.6",
        opts = require('core.plugins.opts.gitsigns'),
        config = require('core.plugins.config.gitsigns'),
    },

    -- symbols outline
    {
        'stevearc/aerial.nvim',
        commit = 'aff1bb8fecff83d3e3a2d544c4d4e6d65718bd19',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
        event = { 'BufRead' },
        opts = require('core.plugins.opts.aerial'),
        config = require('core.plugins.config.aerial')
    },

    -- dashboard
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        opts = require('core.plugins.opts.alpha-nvim'),
        config = require('core.plugins.config.alpha-nvim'),
    },

    -- terminal emulator
    {
        'akinsho/toggleterm.nvim',
        version = "^2.7.0",
        keys = require('core.plugins.keys.toggleterm'),
        opts = require('core.plugins.opts.toggleterm'),
        config = require('core.plugins.config.toggleterm'),
    },

    -- symbol outline
    {
        "utilyre/barbecue.nvim",
        -- branch = "fix/E36",
        event = { "BufReadPost" },
        version = "^1.2.0",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = require('core.plugins.opts.barbecue'),
        config = require('core.plugins.config.barbecue'),
    },

    -- dap
    {
        "mfussenegger/nvim-dap",
        version = "^0.6.0",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                opts = require('core.plugins.opts.nvim-dap-ui'),
                config = require('core.plugins.config.nvim-dap-ui')
            },
            {
                "rcarriga/cmp-dap",
                dependencies = { "nvim-cmp" },
                config = require('core.plugins.config.cmp-dap')
            },
        },
    }
}

return M
