local M = function(_, opts)
    require('mason-lspconfig').setup(opts)

    require("core.utils").lsp_on_attach(function(client, buffer)
        -- set mappings
        local function workspace_symbol()
            vim.ui.input({ prompt = "Symbol Query: " }, function(query)
                if query then require("telescope.builtin").lsp_workspace_symbols { query = query } end
            end)
        end

        if client.server_capabilities.codeActionProvider then
            vim.keymap.set(
                'n',
                '<leader>la',
                function() vim.lsp.buf.code_action() end,
                { buffer = buffer, desc = 'Code action' }
            )
        end

        if client.server_capabilities.documentFormattingProvider then
            vim.keymap.set(
                'n',
                '<leader>lf',
                function() vim.lsp.buf.format({ async = true }) end,
                { buffer = buffer, desc = 'Format' }
            )
        end

        vim.keymap.set(
            'n',
            '<leader>lD',
            function() vim.cmd(':Telescope diagnostics') end,
            { buffer = buffer, desc = 'Workspace diagnostics' }
        )

        if client.server_capabilities.renameProvider then
            vim.keymap.set(
                'n',
                '<leader>lr',
                function() vim.lsp.buf.rename() end,
                { buffer = buffer, desc = 'Document symbols' }
            )
        end

        vim.keymap.set(
            'n',
            '<leader>ls',
            function() require('telescope.builtin').lsp_document_symbols() end,
            { buffer = buffer, desc = 'Document symbols' }
        )

        vim.keymap.set(
            'n',
            '<leader>lS',
            workspace_symbol,
            { buffer = buffer, desc = 'Document symbols' }
        )

        vim.keymap.set(
            'n',
            '<leader>ld',
            function() vim.diagnostic.open_float() end,
            { buffer = buffer, desc = 'Document diagnostics' }
        )

        if client.server_capabilities.hoverProvider then
            vim.keymap.set(
                'n',
                'K',
                function() vim.lsp.buf.hover() end,
                { buffer = buffer, desc = 'Hover' }
            )
        end

        if client.server_capabilities.definitionProvider then
            vim.keymap.set(
                'n',
                'gd',
                function() vim.lsp.buf.definition() end,
                { buffer = buffer, desc = 'Definition' }
            )
        end

        if client.server_capabilities.declarationProvider then
            vim.keymap.set(
                'n',
                'gD',
                function() vim.lsp.buf.declaration() end,
                { buffer = buffer, desc = 'Declaration' }
            )
        end

        if client.server_capabilities.codeLensProvider then
            vim.lsp.codelens.refresh()

            vim.keymap.set(
                'n',
                '<leader>ll',
                function()
                    vim.lsp.codelens.run()
                end,
                { buffer = buffer, desc = 'Run code lens' }
            )

            vim.keymap.set(
                'n',
                '<leader>lL',
                function()
                    vim.lsp.codelens.refresh()
                end,
                { buffer = buffer, desc = 'Refresh code lens' }
            )

            -- create buffer autocmd to update code lens on insert leave
            vim.cmd('autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()')
        end
    end)

    -- Borders for LspInfo winodw
    local win = require("lspconfig.ui.windows")
    local _default_opts = win.default_opts
    local utils = require('core.utils')

    win.default_opts = function(options)
        local win_opts = _default_opts(options)
        win_opts.border = utils.border('FloatBorder')
        return win_opts
    end

    local nvim_lspconfig = require('lspconfig')

    local registry = require('mason-registry')
    local mappings = require('mason-lspconfig').get_mappings()

    local installed_servers = registry.get_installed_package_names()

    for _, mason_name in pairs(installed_servers) do
        local lspconfig_name = mappings.mason_to_lspconfig[mason_name]

        if lspconfig_name == nil then
            goto continue
        end

        -- try to load the 'custom.servers.<mason_name>' module
        local ok, custom_config = pcall(require, 'custom.servers.' .. mason_name)

        -- if has `cmp`, use cmp capabilities, otherwise use vim's default
        local capabilities = nil;

        if utils.is_available('cmp-nvim-lsp') then
            require('lazy').load({ plugins = { 'cmp-nvim-lsp' } })
            capabilities = require('cmp_nvim_lsp').default_capabilities()
        else
            capabilities = vim.lsp.protocol.make_client_capabilities()
        end

        local config = {
            capabilities = capabilities
        }

        if ok then
            -- if it is a table, extend the config
            -- if it is a function, call it with the config as an argument
            if type(custom_config) == 'table' then
                config = vim.tbl_deep_extend('force', config, custom_config)
            elseif type(custom_config) == 'function' then
                config = custom_config(config)
                goto continue
            end
        end

        if lspconfig_name then
            nvim_lspconfig[lspconfig_name].setup(config)
        end

        ::continue::
    end
end

return M
