local M = {
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
}


return M
