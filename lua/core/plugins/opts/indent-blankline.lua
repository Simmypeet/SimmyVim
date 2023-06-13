local M = {
    indentline_enabled = 1,
    char = "▏",
    context_char = "▏",
    show_end_of_line = false,
    space_char_blankline = " ",
    show_current_context = false,
    show_current_context_start = false,
    use_treesitter = true,
    filetype_exclude = {
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
    buftype_exclude = {
        "terminal",
        "nofile",
    },
    -- char_highlight_list = {
    --   "IndentBlanklineIndent1",
    --   "IndentBlanklineIndent2",
    --   "IndentBlanklineIndent3",
    --   "IndentBlanklineIndent4",
    --   "IndentBlanklineIndent5",
    --   "IndentBlanklineIndent6",
    -- },
}

return M
