local M = {
    ensure_installed = { "lua" },

    highlight = {
        enable = true,
        use_languagetree = true,
        disable = function(lang, buf)
            local max_filesize = 1024 * 1024 -- 1MB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },

    indent = { enable = false },
}

return M
