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

--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available
M.is_available = function(plugin)
    local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
    return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end

--- Get highlight properties for a given highlight name
---@param name string The highlight group name
---@param fallback? table The fallback highlight properties
---@return table properties # the highlight group properties
M.get_hlgroup = function(name, fallback)
    if vim.fn.hlexists(name) == 1 then
        local hl
        if vim.api.nvim_get_hl then -- check for new neovim 0.9 API
            hl = vim.api.nvim_get_hl(0, { name = name, link = false })
            if not hl.fg then hl.fg = "NONE" end
            if not hl.bg then hl.bg = "NONE" end
        else
            hl = vim.api.nvim_get_hl_by_name(name, vim.o.termguicolors)
            if not hl.foreground then hl.foreground = "NONE" end
            if not hl.background then hl.background = "NONE" end
            hl.fg, hl.bg = hl.foreground, hl.background
            hl.ctermfg, hl.ctermbg = hl.fg, hl.bg
            hl.sp = hl.special
        end
        return hl
    end
    return fallback or {}
end

M.autogroup = function(name)
    return vim.api.nvim_create_augroup("simmy_" .. name, { clear = true })
end

M.override_hl = function(overrides)
    local callback = function()
        local overrides_spec
        if type(overrides) == "function" then
            overrides_spec = overrides()
        else
            overrides_spec = overrides
        end

        for hlgroup, hlvalues in pairs(overrides_spec) do
            vim.api.nvim_set_hl(0, hlgroup, hlvalues)
        end
    end

    callback()

    vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
        group = M.autogroup("override_hl"),
        callback = callback
    })
end

return M
