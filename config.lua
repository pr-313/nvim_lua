-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = false
vim.opt.timeoutlen = 300
vim.opt.guicursor = ""
-- general
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = false,
    pattern = "*.lua",
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
require("user.plugins")
-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = " "

lvim.builtin.illuminate.active = false
lvim.builtin.lir.active = false
lvim.builtin.project.active = false
lvim.builtin.dap.active = false
lvim.builtin.bufferline.active = true
lvim.builtin.telescope.active = true

lvim.builtin.terminal.active = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = false

lvim.builtin.telescope.defaults.path_display = { truncate = 5 }

vim.api.nvim_clear_autocmds { pattern = "alpha", group = "_filetype_settings" }

-- add your own keymapping
require("user.keymaps")
require("user.telescope")
require("user.colors")
require("user.alpha")
require("user.nvim_tree")
require("user.cmp")
require("user.lualine")
require("user.autocommands")

vim.cmd("silent! source ~/my_nvim/*.vim")
