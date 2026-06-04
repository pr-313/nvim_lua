local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

vim.g.indent_blankline_enabled = false

indent_blankline.setup {
    indent_blankline_enabled = false,
    show_current_context = true,
    indent_blankline_char = "▏",
    indent_blankline_show_trailing_blankline_indent = false,
    indent_blankline_show_first_indent_level = true,
    indent_blankline_use_treesitter = true,
    indent_blankline_show_current_context = true,
    indent_blankline_buftype_exclude = { "terminal", "nofile" },
    indent_blankline_filetype_exclude = {
        "help",
        "packer",
        "NvimTree",
    },
}
