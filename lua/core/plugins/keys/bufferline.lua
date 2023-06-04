local M = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",                              desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>",                   desc = "Delete non-pinned buffers" },
    { "<tab>",      "<Cmd>BufferLineCycleNext<CR>",                              desc = "Next buffer" },
    { "<S-tab>",    "<Cmd>BufferLineCyclePrev<CR>",                              desc = "Previous buffer" },
    { "<leader>bx", "<Cmd>BufferLineCloseLeft<CR><CMD>BufferLineCloseRight<CR>", desc = "Close all buffers but this one" }
}

return M
