local M = {}

local utils = require('core.utils')

M.initialize_options = function()
    -- set useful highlight groups
    utils.set_hl(function()
        local normal = utils.get_hlgroup('Normal')
        local visual = utils.get_hlgroup('Visual')
        return {
            ['SimmyBorder'] = {
                bg = normal.bg,
                fg = visual.bg,
            }
        }
    end)

    -- disable some default providers
    for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
        vim.g["loaded_" .. provider .. "_provider"] = 0
    end

    vim.opt.shortmess:append({ W = true, I = true, c = true })
    if vim.fn.has("nvim-0.9.0") == 1 then
        vim.opt.splitkeep = "screen"
        vim.opt.shortmess:append({ C = true })
    end

    vim.opt.whichwrap:append "<>[]hl"

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "qf",
        callback = function()
            vim.opt_local.buflisted = false
        end,
    })

    local default_options = require('core.options')
    local user_options = utils.load_options('custom.options')

    local final = vim.tbl_deep_extend('force', default_options, user_options)

    Simmy = final

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
