local M = function(_, opts)
    require('aerial').setup(opts)

    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            vim.keymap.set('n', '<leader>lp', function() vim.cmd('AerialToggle right') end,
                { buffer = args.buf, desc = "toggle symbol outlines" })
        end,
    })
end

return M
