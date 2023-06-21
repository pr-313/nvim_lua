local status_ok, sb = pcall(require, "sidebar-nvim")
if not status_ok then
    return
end
sb.setup({
    disable_default_keybindings = 0,
    bindings = {
        ["q"] = function()
            sb.close()
        end,
    },
    open = false,
    side = "left",

    initial_width = 35,
    hide_statusline = false,
    update_interval = 1000,
    sections = { "git", "buffers" },
    section_separator = { "", "-----", "" },
    section_title_separator = { "" },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    todos = { ignored_paths = { "~" } },
    buffers = {
        icon = "",
        ignored_buffers = {},      -- ignore buffers by regex
        sorting = "id",            -- alternatively set it to "name" to sort by buffer name instead of buf id
        show_numbers = true,       -- whether to also show the buffer numbers
        ignore_not_loaded = false, -- whether to ignore not loaded buffers
        ignore_terminal = true,    -- whether to show terminal buffers in the list
    }
})
