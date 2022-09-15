local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local status_ok, git_blame = pcall(require, "gitblame")
if not status_ok then
    return
end

vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
vim.g.gitblame_message_template = '<author> | <date> | <sha>'

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = {'|', '|'},
    section_separators = {'|', '|'},
    globalstatus = false,
    always_divide_middle = false,
    disabled_filetypes = {"NvimTree"},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'filename', 
                    path = 1}},
    lualine_x = {{git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available}, {require('auto-session-library').current_session_name},'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  -- tabline = {},
  extensions = {}
}
