local M = {}

M.vim = {
    opt = {
        autowrite = true,           -- Enable auto write
        autoread = true,
        clipboard = "unnamedplus",  -- Sync with system clipboard
        completeopt = "menu,menuone,noselect",
        conceallevel = 3,           -- Hide * markup for bold and italic
        confirm = true,             -- Confirm to save changes before exiting modified buffer
        cursorline = true,          -- Enable highlighting of the current line
        expandtab = true,           -- Use spaces instead of tabs
        formatoptions = "jcroqlnt", -- tcqj
        grepformat = "%f:%l:%c:%m",
        grepprg = "rg --vimgrep",
        ignorecase = true,      -- Ignore case
        inccommand = "nosplit", -- preview incremental substitute
        laststatus = 0,
        swapfile = false,
        list = true,            -- Show some invisible characters (tabs...
        mouse = "a",            -- Enable mouse mode
        number = true,          -- Print line number
        pumblend = 10,          -- Popup blend
        pumheight = 10,         -- Maximum number of entries in a popup
        cmdheight = 0,
        relativenumber = true, -- Relative line numbers
        ruler = false,
        scrolloff = 8,          -- Lines of context
        sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
        shiftround = true,      -- Round indent
        shiftwidth = 4,         -- Size of an indent
        showmode = false,       -- Dont show mode since we have a statusline
        sidescrolloff = 8,      -- Columns of context
        signcolumn = "yes",     -- Always show the signcolumn, otherwise it would shift the text each time
        smartcase = true,       -- Don't ignore case with capitals
        smartindent = true,     -- Insert indents automatically
        spelllang = { "en" },
        splitbelow = true,      -- Put new windows below current
        splitright = true,      -- Put new windows right of current
        tabstop = 4,            -- Number of spaces tabs count for
        termguicolors = true,   -- True color support
        timeoutlen = 300,
        fillchars = { eob = " " },
        undofile = true,
        undolevels = 10000,
        updatetime = 200,               -- Save swap file and trigger CursorHold
        wildmode = "longest:full,full", -- Command-line completion mode
        winminwidth = 5,                -- Minimum window width
        wrap = false                    -- Disable line wrap
    },

    g = {
        mapleader = " ",
        maplocalleader = " "
    },
}

return M
