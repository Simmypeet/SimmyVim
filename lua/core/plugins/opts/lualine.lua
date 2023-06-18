local M = function()
    local util = require('core.utils')

    return {
        options = {
            theme = "auto",
            globalstatus = true,
            disabled_filetypes = { statusline = { "dashboard", "alpha" } },
            section_separators = { left = "▌", right = "▐" },
            component_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = {
                {
                    "diagnostics",
                    symbols = {
                        error = " ",
                        warn = " ",
                        info = " ",
                        hint = " ",
                    },
                },
                {
                    "filetype",
                    icon_only = true,
                    separator = "",
                    padding = {
                        left = 1, right = 0 }
                },
                { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            },
            lualine_x = {
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = util.fg("Special")
                },
                {
                    "diff",
                    symbols = {
                        added = "  ",
                        modified = "  ",
                        removed = "  ",
                    },
                },
            },
            lualine_y = {
                -- show current active lsp clients
                {
                    function()
                        local clients = vim.lsp.get_active_clients()
                        if next(clients) == nil then
                            return ""
                        end
                        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                        local buf_clients = {}
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                table.insert(buf_clients, client.name)
                            end
                        end
                        return table.concat(buf_clients, " ")
                    end,
                    icon = "  ~",
                }
            },
            lualine_z = {
                {
                    function()
                        -- get the name of the current directory (tail path)
                        local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

                        if dir_name == "" then
                            dir_name = vim.fn.expand("%")
                        end

                        return dir_name
                    end,
                    icon = "  ~",
                }
            },
        },
        extensions = { "neo-tree", "lazy" },
    }
end

return M
