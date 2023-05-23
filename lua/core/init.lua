local M = {}

local utils = require('core.utils')

M.initialize_options = function()
    local default_options = require('core.options')
    local user_options = utils.load_options('custom.options')

    local final = vim.tbl_deep_extend('force', default_options, user_options)

    if final.vim ~= nil then
        for scope, table in pairs(final.vim) do
            for setting, value in pairs(table) do
                vim[scope][setting] = value
            end
        end
    end
end

M.initialize_plugins = function()
    -- setup lazy.nvim
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    local spec = {
        spec = {
            { import = "core.plugins" },
            { import = "custom.plugins" },
        },
        defaults = {
            lazy = true,
            version = "*"
        },
        ui = {
            icons = {
                ft = "",
                lazy = "󰂠 ",
                loaded = "",
                not_loaded = "",
            },
        },
        performance = {
            rtp = {
                disabled_plugins = {
                    "2html_plugin",
                    "man",
                    "tohtml",
                    "getscript",
                    "getscriptPlugin",
                    "gzip",
                    "logipat",
                    "netrw",
                    "netrwPlugin",
                    "netrwSettings",
                    "netrwFileHandlers",
                    "matchit",
                    "tar",
                    "tarPlugin",
                    "rrhelper",
                    "spellfile_plugin",
                    "vimball",
                    "vimballPlugin",
                    "zip",
                    "zipPlugin",
                    "tutor",
                    "rplugin",
                    "syntax",
                    "synmenu",
                    "optwin",
                    "compiler",
                    "bugreport",
                    "ftplugin",
                },
            },
        }
    }

    require('lazy').setup(spec)
end

return M
