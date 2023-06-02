local M = {
    -- file explorer
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        keys = require('core.plugins.keys.nvim-tree'),
        opts = require('core.plugins.opts.nvim-tree'),
        config = require('core.plugins.config.nvim-tree')
    },

    -- which key
    {
        "folke/which-key.nvim",
        lazy = false,
        config = require('core.plugins.config.which-key')
    },

    -- treesitter syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        version = false,
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = require('core.plugins.opts.nvim-treesitter'),
        config = require('core.plugins.config.nvim-treesitter')
    },

    -- lsp-progress
    {
        'linrongbin16/lsp-progress.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = require('core.plugins.opts.lsp-progress'),
        config = require('core.plugins.config.lsp-progress')
    },

    -- indent guides for Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = require('core.plugins.opts.indent-blankline'),
    },

    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        keys = require('core.plugins.keys.nvim-notify'),
        opts = require('core.plugins.opts.nvim-notify'),
        config = require('core.plugins.config.nvim-notify')
    },

    -- telescope fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        cmd = { 'Telescope' },
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        opts = require('core.plugins.opts.telescope'),
        keys = require('core.plugins.keys.telescope'),
        config = require('core.plugins.config.telescope')
    },

    -- mason lsp
    {
        'williamboman/mason.nvim',
        version = "^1",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = require('core.plugins.config.mason')
    },

    -- mason lsp config
    {
        'williamboman/mason-lspconfig.nvim',
        version = "^1.1",
        opts = require('core.plugins.opts.mason-lspconfig'),
        config = require('core.plugins.config.mason-lspconfig')
    },


    {
        'ray-x/lsp_signature.nvim',
        opts = require('core.plugins.opts.lsp_signature'),
        config = require('core.plugins.config.lsp_signature')
    },

    -- lspconfig
    {
        'neovim/nvim-lspconfig',
        commit = '8356319af6e8012a5797b647e946b377d1ba3d9c',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'folke/neodev.nvim',
            'ray-x/lsp_signature.nvim'
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
        event = "VeryLazy",
        opts = require('core.plugins.opts.lualine'),
    },

    -- lsp symbol navigation for lualine
    {
        "SmiteshP/nvim-navic",
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
        keys = require('core.plugins.keys.bufferline'),
        opts = require('core.plugins.opts.bufferline'),
    },

    -- buffer remove
    {
        "echasnovski/mini.bufremove",
        lazy = false,
        keys = require('core.plugins.keys.mini-bufremove'),
    },


    -- completion suggestions
    {
        'hrsh7th/nvim-cmp',
        lazy = false,
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',

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
        event = { 'BufRead' },
        opts = require('core.plugins.opts.nvim-scrollbar'),
    },

    -- git
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufRead' },
        opts = require('core.plugins.opts.gitsigns'),
        config = require('core.plugins.config.gitsigns'),
    },

    -- symbols outline
    {
        'stevearc/aerial.nvim',
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
        keys = require('core.plugins.keys.toggleterm'),
        opts = require('core.plugins.opts.toggleterm'),
        config = require('core.plugins.config.toggleterm'),
    },

    -- symbol outline
    {
        "utilyre/barbecue.nvim",
        -- branch = "fix/E36",
        event = { "BufReadPost" },
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
