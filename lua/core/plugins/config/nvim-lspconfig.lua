local M = function(_, opts)
    -- set icons for diagnostics
    local icons = require('core.icons')
    local utils = require('core.utils')
    for name, icon in pairs(icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    local diagnostic_float = function()
        vim.diagnostic.open_float({
            focus = false,
            border = false,
        })
    end

    vim.api.nvim_create_autocmd(
        {
            "LspAttach"
        },
        {
            group = utils.autogroup("lsp_attach"),
            callback = function(args)
                local buffer = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)

                -- set mappings
                local function workspace_symbol()
                    vim.ui.input({ prompt = "Symbol Query: " }, function(query)
                        if query then require("telescope.builtin").lsp_workspace_symbols { query = query } end
                    end)
                end

                if client.server_capabilities.semanticTokensProvider ~= nil then
                    if not opts.semantic_highlighting then
                        client.server_capabilities.semanticTokensProvider = nil
                    end
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
                        function()
                            vim.lsp.buf.format({ async = true })
                            vim.diagnostic.enable(0)
                        end,
                        { buffer = buffer, desc = 'Format' }
                    )

                    if Simmy.lsp.auto_format then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = buffer,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = buffer })
                                vim.diagnostic.enable(0)
                            end,
                        })
                    end
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

                -- restart lsp server
                vim.keymap.set(
                    'n',
                    '<leader>l/',
                    function()
                        vim.lsp.stop_client(vim.lsp.get_active_clients())
                        vim.diagnostic.reset()

                        vim.schedule(function()
                            vim.cmd('silent! bufdo e')
                        end)
                    end,
                    { buffer = buffer, desc = 'Restart LSP server' }
                )

                vim.keymap.set(
                    'n',
                    '<leader>ls',
                    function() require('telescope.builtin').lsp_document_symbols() end,
                    { buffer = buffer, desc = 'Rename' }
                )

                vim.keymap.set(
                    'n',
                    '<leader>lS',
                    workspace_symbol,
                    { buffer = buffer, desc = 'Find workspace symbols' }
                )

                vim.keymap.set(
                    'n',
                    '<leader>ld',
                    diagnostic_float,
                    { buffer = buffer, desc = 'Float diagnostics' }
                )

                vim.keymap.set(
                    'n',
                    '<leader>li',
                    '<CMD>LspInfo<CR>',
                    { buffer = buffer, desc = 'Lsp information' }
                )

                if client.server_capabilities.hoverProvider then
                    vim.keymap.set(
                        'n',
                        'K',
                        function() vim.lsp.buf.hover() end,
                        { buffer = buffer, desc = 'Hover' })
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
            end
        })

    vim.keymap.set(
        'n',
        '<leader>il',
        "<CMD>LspInfo<CR>",
        { desc = 'Lsp information' }
    )

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
            border = false,
            silent = true,
        }
    )
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
            border = false,
            silent = true,
        }
    )

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
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities.textDocument.completion.completionItem = {
            documentationFormat = { "markdown", "plaintext" },
            snippetSupport = true,
            preselectSupport = true,
            insertReplaceSupport = true,
            labelDetailsSupport = true,
            deprecatedSupport = true,
            commitCharactersSupport = true,
            tagSupport = { valueSet = { 1 } },
            resolveSupport = {
                properties = {
                    "documentation",
                    "detail",
                    "additionalTextEdits",
                },
            },
        }

        local config = {
            capabilities = capabilities,
            -- the root dir must be the same as the current working dir
            -- otherwise, the lsp server will not be able to find the project root
            root_dir = function()
                local cwd = vim.fn.getcwd()
                return cwd
            end,
        }

        if ok then
            -- if it is a table, extend the config
            -- if it is a function, call it with the config as an argument
            if type(custom_config) == 'table' then
                config = vim.tbl_deep_extend('force', custom_config, config)
            elseif type(custom_config) == 'function' then
                custom_config(config)
                goto continue
            end
        end

        nvim_lspconfig[lspconfig_name].setup(config)

        ::continue::
    end
end

return M
