local M = {
    -- no italics
    no_italic = true,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "bold" },
        functions = { "italic" },
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = { "bold" },
        booleans = { "bold" },
        properties = {},
        types = { "italic" },
        operators = {},
    },
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.1,
    },
}

return M
