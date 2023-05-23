local M = function()
    vim.g.navic_silence = true
    require("core.utils").lsp_on_attach(function(client, buffer)
        if client.server_capabilities.documentSymbolProvider then
            require("nvim-navic").attach(client, buffer)
        end
    end)
end

return M
