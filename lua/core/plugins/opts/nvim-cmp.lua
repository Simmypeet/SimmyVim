local M = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local icons = require('core.icons')
    local utils = require('core.utils')

    local config = {
        fields = { "abbr", "kind", "menu" },
        completion = {
            completeopt = 'menu,menuone'
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },

        sources = {
            { name = 'path',     priority = 500 },
            { name = 'nvim_lsp', priority = 1000 },
            { name = 'buffer',   keyword_length = 3, priority = 500 },
            { name = 'luasnip',  keyword_length = 2, priority = 750 },
            { name = 'nvim_lua', priority = 500 }
        },

        window = {
            completion = cmp.config.window.bordered({
                side_padding = 1,
                scrollbar = false,
            }),
            documentation = {
                border = utils.border('CmpDocBorder'),
            }
        },

        formatting =
        {
            -- default fields order i.e completion word + item.kind + item.kind icons
            fields = { "abbr", "kind", "menu" },

            format = function(_, item)
                if icons.kinds[item.kind] ~= nil then
                    item.kind = icons.kinds[item.kind] .. " " .. item.kind
                else
                    item.kind = item.kind
                end

                return item
            end,
        },

        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-l>"] = cmp.mapping(function(fallback)
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ["<C-h>"] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
        },
    }

    config.window.documentation.border = utils.border('CmpDocBorder')

    return config
end

return M
