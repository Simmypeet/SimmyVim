local M = {
    window = {
        mappings = {
            ['l'] = 'open',
            ['h'] = 'close_node',
        },
        buffers = {
            follow_current_file = false,
        }
    },

    source_selector = {
        winbar = true,
        content_layout = "center",
        sources = {
            { source = "filesystem",  display_name = " File" },
            { source = "buffers",     display_name = " Bufs" },
            { source = "git_status",  display_name = " Git" },
            { source = "diagnostics", display_name = "󰍉 Diagnostic" },
        },
    },

    default_component_configs = {
        indent = { padding = 0, indent_size = 2 },
        modified = { symbol = "" },
        git_status = {
            symbols = {
                added = "",
                deleted = "",
                modified = "",
                renamed = "➜",
                untracked = "★",
                ignored = "◌",
                unstaged = "●",
                staged = "✚",
                conflict = "",
            }
        }
    },

    filesystem = {
        filtered_items = {
            visible = true
        },
        follow_current_file = false,
        use_libuv_file_watcher = true,
    },

    buffers = {
        follow_current_file = false,
    }
}

return M
