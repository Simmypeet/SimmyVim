local M = {}

M.try_require = function(module)
    local status, result = pcall(require, module)
    if status then
        return result
    else
        return nil
    end
end

M.load_options = function(module)
    local options = M.try_require(module)

    if options == nil then
        return {}
    end
    if type(options) == 'function' then
        local result = options()
        return result and result or {}
    else
        return options and options or {}
    end
end

M.fg = function(name)
    local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name }) or vim.api.nvim_get_hl_by_name(name, true)
    local fg = hl and hl.fg or hl.foreground
    return fg and { fg = string.format("#%06x", fg) }
end

M.lsp_on_attach = function(on_attach)
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, buffer)
        end,
    })
end

M.border = function(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

return M
