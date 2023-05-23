local M = function(opts)
    require('rust-tools').setup({
        tools = {
            inlay_hints = {
                auto = true,
            },
        },

        server = {
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
            handlers = opts.handlers,
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

return M
