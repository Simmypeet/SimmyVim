local M = {
    indent = { char = "▏" },
    exclude = {
        filetypes = {
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "alpha",
            "neo-tree",
        },
        buftypes = {
            "terminal",
            "nofile",
        }
    },
    scope = {
        enabled = false,
    }
}

return M
