--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
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
lvim.use_icons = false

-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewFileHistory" }, lazy = true,
    config = function () require("user.diffview") end},
  { "szw/vim-maximizer", cmd = { "MaximizerToggle" }, lazy = true },
  { "mbbill/undotree", cmd = { "UndotreeToggle" }, lazy = true },
  { "ellisonleao/gruvbox.nvim" },
  -- Fzf
  {'ibhagwan/fzf-lua', cmd={'FzfLua'}, lazy=true, dependencies="fzf",
      config = function () require"user.fzf-lua" end},
  {'junegunn/fzf', build = './install --all', lazy=true},
}

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = ","
-- add your own keymapping
require("user.keymaps")
require("user.telescope")

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

require("user.colors")
require("user.alpha")
require("user.nvim_tree")
require("user.cmp")

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

lvim.lsp.automatic_configuration.skipped_filetypes[1] = "markdown"
lvim.lsp.automatic_configuration.skipped_filetypes[2] = "rst"
lvim.lsp.automatic_configuration.skipped_filetypes[3] = "plaintext"
lvim.lsp.automatic_configuration.skipped_filetypes[4] = "toml"
lvim.lsp.automatic_configuration.skipped_filetypes[5] = "proto"
lvim.lsp.automatic_configuration.skipped_filetypes[6] = "verilog"
