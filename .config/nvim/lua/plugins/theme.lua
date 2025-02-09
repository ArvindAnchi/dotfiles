return {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            term_colors = true,
            transparent_background = false,
            no_italic = false,
            no_bold = false,
            styles = {
                comments = {},
                conditionals = {},
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
            },
            color_overrides = {
                mocha = {
                    base = "#111111",
                    mantle = "#111111",
                    crust = "#111111",
                },
            },
            highlight_overrides = {
                mocha = function(C)
                    return {
                        TabLineSel = { bg = C.pink },
                        CmpBorder = { fg = C.surface2 },
                        Pmenu = { bg = C.none },
                        TelescopeBorder = { link = "FloatBorder" },
                    }
                end,
            },
        }

        vim.cmd.colorscheme "catppuccin"
    end,
}
