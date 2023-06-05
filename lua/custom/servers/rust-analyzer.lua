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
        }
    }
}

return M
