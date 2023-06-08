local M = {
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

return M
