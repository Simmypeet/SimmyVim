local M = function(_, opts)
    -- set icons for diagnostics
    local icons = require('core.icons')
    for name, icon in pairs(icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
end

return M
