local status_ok, registers = pcall(require, "registers")
if not status_ok then
	return
end
registers.setup({
    show = "*+\"-/_=#%.0123456789abcdefghijklmnopqrstuvwxyz:",
    show_empty = true,
    register_user_command = true,
    system_clipboard = true,
    trim_whitespace = true,
    hide_only_whitespace = true,
    show_register_types = true,

    bind_keys = {
        normal = registers.show_window({ mode = "motion" }),
        visual = registers.show_window({ mode = "motion" }),
        insert = registers.show_window({ mode = "insert" }),
        registers = registers.apply_register({ delay = 0.1 }),
        return_key = registers.apply_register(),
        escape = registers.close_window(),
        ctrl_n = registers.move_cursor_down(),
        ctrl_p = registers.move_cursor_up(),
        ctrl_j = registers.move_cursor_down(),
        ctrl_k = registers.move_cursor_up(),
    },

    symbols = {
        newline = "⏎",
        space = " ",
        tab = "·",
        register_type_charwise = "ᶜ",
        register_type_linewise = "ˡ",
        register_type_blockwise = "ᵇ",
    },

    window = {
        max_width = 100,
        highlight_cursorline = true,
        border = "none",
        transparency = 10,
    },

    sign_highlights = {
        cursorline = "Visual",
        selection = "Constant",
        default = "Function",
        unnamed = "Statement",
        read_only = "Type",
        expression = "Exception",
        black_hole = "Error",
        alternate_buffer = "Operator",
        last_search = "Tag",
        delete = "Special",
        yank = "Delimiter",
        history = "Number",
        named = "Todo",
    },
})
