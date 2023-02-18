--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

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
lvim.plugins = {
    { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewFileHistory" }, lazy = true,
        config = function() require("user.diffview") end },

    { "szw/vim-maximizer", cmd = { "MaximizerToggle" }, lazy = true },

    { "mbbill/undotree", cmd = { "UndotreeToggle" }, lazy = true },

    { "ellisonleao/gruvbox.nvim" },
    -- { "f-person/git-blame.nvim", lazy = true, event = "User FileOpened" },
    -- Fzf
    { 'ibhagwan/fzf-lua', cmd = { 'FzfLua' }, lazy = true, dependencies = "fzf",
        config = function() require "user.fzf-lua" end },
    { 'junegunn/fzf', build = './install --all', lazy = true },

    { "rlane/pounce.nvim", cmd = { "Pounce" }, lazy = true,
        config = function() require 'user.pounce' end },

    { "vhda/verilog_systemverilog.vim", lazy = true, ft = { "verilog_systemverilog", "verilog", "systemverilog" } },

    { "godlygeek/tabular", cmd = { "Tab" }, lazy = true },

    { "tpope/vim-fugitive", cmd = { "G", "Gvdiffsplit" }, lazy = true },

    { "folke/todo-comments.nvim", event = "BufEnter", lazy = true, dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require "user.todo_comment" end }, -- TODO Highlight

    { "ThePrimeagen/harpoon", lazy = true, event = "VeryLazy",
        config = function() require "user.harpoon" end },
}

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = ","

lvim.builtin.illuminate.active = false
lvim.builtin.lir.active = false
lvim.builtin.project.active = false
lvim.builtin.dap.active = false
lvim.builtin.bufferline.active = false
lvim.builtin.telescope.active = true

lvim.builtin.terminal.active = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = false
lvim.builtin.mason.install_root_dir = "/runs/simrun_tav/libs/lsp_server"
lvim.lsp.nlsp_settings.setup.config_home = "/runs/simrun_tav/libs/lvim/lsp-settings"
lvim.lsp.templates_dir = "/runs/simrun_tav/libs/lunarvim/site/after/ftplugin"

lvim.lsp.automatic_configuration.skipped_filetypes[6] = "verilog"
lvim.lsp.automatic_configuration.skipped_servers[43] = "svls"
lvim.lsp.automatic_configuration.skipped_servers[44] = "sumneko_lua"

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
