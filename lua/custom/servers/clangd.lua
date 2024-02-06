local M = {
    on_attach = function(_, _)
        -- add switch header/source file
        vim.api.nvim_set_keymap('n', '<leader>lh', '<cmd>ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })
    end,

    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
        "--background-index",
        "--clang-tidy",
        "--completion-style=bundled",
        "--cross-file-rename",
        "--header-insertion=iwyu",
    },

}

return M
