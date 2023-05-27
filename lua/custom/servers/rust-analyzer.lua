local M = function(opts)
    require('rust-tools').setup({
        tools = {
            inlay_hints = {
                auto = true,
            },
        },

        server = {
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

return M
