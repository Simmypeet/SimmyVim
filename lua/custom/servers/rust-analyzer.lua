return function(opts)
    require('rust-tools').setup({
        tools = {
            inlay_hints = {
                auto = true,
            },
        },

        server = {
            on_attach = function(client, buffer)
                -- disable semantic tokens for rust-analyzer. It has very poor performance on large files
                -- if client.server_capabilities.semanticTokensProvider ~= nil then
                -- client.server_capabilities.semanticTokensProvider = nil
                -- end
            end,
            capabilities = opts.capabilities,
            root_dir = opts.root_dir,

            settings = {
                ['rust-analyzer'] = {
                    checkOnSave = {
                        command = "clippy"
                    },
                    rustfmt = {
                        extraArgs = { "+nightly" }
                    },
                }
            }
        },
    })
end
