local M = function(config)
    require('rust-tools').setup({
        tools = {
            inlay_hints = {
                auto = false
            }
        },
        server = {
            capabilities = config.capabilities,
            settings = {
                ['rust-analyzer'] = {
                    checkOnSave = {
                        command = "clippy"
                    },
                    rustfmt = {
                        extraArgs = { "+nightly" }
                    },
                    diagnostics = {
                        disabled = { "unresolved-proc-macro" }
                    },
                    cargo = {
                        features = 'all',
                    },
                    workspace = {
                        ignoreFolders = {
                            "$HOME",
                            "$HOME/.cargo/**",
                            "$HOME/.rustup/**"
                        }
                    }
                }
            }
        }
    })
end

return M
