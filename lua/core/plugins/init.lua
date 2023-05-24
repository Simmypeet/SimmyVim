local M = {
    -- file explorer
    {
        'nvim-neo-tree/neo-tree.nvim',
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = require('core.plugins.opts.neo-tree'),
        keys = require('core.plugins.keys.neo-tree'),
        config = require('core.plugins.config.neo-tree'),
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

    -- tokyo night colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function(_, opts)
            require('tokyonight').setup(opts)
        end,
    },

    -- indent guides for Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = require('core.plugins.opts.indent-blankline'),
    },

    -- better notfication ui
    {
        "rcarriga/nvim-notify",
        lazy = false,
        keys = require('core.plugins.keys.nvim-notify'),
        opts = require('core.plugins.opts.nvim-notify'),
        config = require('core.plugins.config.nvim-notify'),
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
        build = ':MasonUpdate',
        cmd = {
            "Mason",
            "MasonInstall",
            "MasonInstallAll",
            "MasonUninstall",
            "MasonUninstallAll",
            "MasonLog"
        },
        config = function()
            require('mason').setup({
                ensure_installed = {
                    'lua-language-server'
                }
            })
        end
    },

    -- mason lsp config
    {
        'williamboman/mason-lspconfig.nvim',
        event = 'BufReadPre',
        version = "^1.1",
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim'
        },
        config = require('core.plugins.config.mason-lspconfig')
    },

    -- lspconfig
    {
        'neovim/nvim-lspconfig',
        commit = '8356319af6e8012a5797b647e946b377d1ba3d9c',
        opts = require('core.plugins.opts.nvim-lspconfig'),
        config = require('core.plugins.config.nvim-lspconfig')
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
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
        lazy = true,
        init = require('core.plugins.init.dressing'),
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

    -- auto pairs
    {
        "windwp/nvim-autopairs",
        lazy = false,
        opts = require('core.plugins.opts.nvim-autopairs'),
        config = require('core.plugins.config.nvim-autopairs')
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
    },
}

return M
