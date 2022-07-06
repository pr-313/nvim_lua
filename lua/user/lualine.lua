local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

-- local hide_in_width = function()
--   return vim.fn.winwidth(0) > 80
-- end
--
-- local diagnostics = {
--   "diagnostics",
--   sources = { "nvim_diagnostic" },
--   sections = { "error", "warn" },
--   symbols = { error = " ", warn = " " },
--   colored = false, always_visible = true,
-- }
--
-- local diff = {
--   "diff",
--   colored = false,
--   symbols = { added = "", modified = "", removed = "" }, -- changes diff symbols
--   cond = hide_in_width,
-- }
--
-- local filetype = {
--   "filetype",
--   icons_enabled = false,
-- }
--
-- local location = {
--   "location",
--   padding = 0,
-- }
--
-- local spaces = function()
--   return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = {'|', '|'},
    section_separators = {'|', '|'},
    globalstatus = false,
    always_divide_middle = false,
    disabled_filetypes = { "alpha", "dashboard" },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'FugitiveHead'},
    lualine_c = {{'filename', 
                    path = 1}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
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
  tabline = {},
  extensions = {}
}
