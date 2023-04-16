local status_ok, gruvbox = pcall(require, "gruvbox")
if not status_ok then
    return
end
-- setup must be called before loading the colorscheme
-- Default options:
gruvbox.setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        operators = true,
        comments = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,    -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
})

-- -- Change theme settings
lvim.colorscheme = "gruvbox"
