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
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    enabled = false,
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
  }
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
lvim.builtin.breadcrumbs.active = false

lvim.builtin.terminal.active = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = false
lvim.builtin.telescope.defaults.path_display = { shorten = 5 }
