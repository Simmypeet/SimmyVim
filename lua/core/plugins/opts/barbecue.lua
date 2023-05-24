local icons = require('core.icons')

local M = {
    theme = "auto",
    include_buftypes = { "" },
    exclude_filetypes = { "gitcommit", "Trouble", "toggleterm" },
    show_modified = false,
    kinds = icons.kinds,
}

return M
