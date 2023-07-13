lvim.plugins = {
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        lazy = true,
        config = function() require("user.diffview") end
    },

    {
        "szw/vim-maximizer",
        cmd = { "MaximizerToggle" },
        lazy = true
    },
    {
        "mbbill/undotree",
        cmd = { "UndotreeToggle" },
        lazy = true
    },

    {
        "ellisonleao/gruvbox.nvim",
    },

    -- Fzf
    {
        'ibhagwan/fzf-lua',
        cmd = { 'FzfLua' },
        lazy = true,
        dependencies = "fzf",
        config = function() require "user.fzf-lua" end
    },

    {
        "preservim/tagbar",
        cmd = { "TagbarToggle" },
        lazy = true
    },

    {
        'junegunn/fzf',
        build = './install --all',
        lazy = true
    },
    {
        "rlane/pounce.nvim",
        cmd = { "Pounce" },
        lazy = true,
        config = function() require 'user.pounce' end,
        enabled = false
    },
    {
        "folke/flash.nvim",
        event = "BufReadPost",
        opts = require("user.flash.flash_cfg"),
        keys = require("user.flash.flash_keys"),
        lazy = true
    },

    {
        "vhda/verilog_systemverilog.vim",
        lazy = true,
        ft = { "verilog_systemverilog", "verilog", "systemverilog" }
    },

    {
        "godlygeek/tabular",
        cmd = { "Tab" },
        lazy = true
    },
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Gvdiffsplit" },
        lazy = true
    },
    {
        "folke/todo-comments.nvim",
        event = "BufReadPost",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require "user.todo_comment" end
    }, -- TODO Highlight

    {
        "ThePrimeagen/harpoon",
        lazy = true,
        event = "VeryLazy",
        enabled = false,
        config = function() require "user.harpoon" end
    },

    {
        "jubnzv/mdeval.nvim",
        lazy = true,
        ft = { "markdown" },
        event = "BufReadPost",
        enabled = false,
        config = function() require "user.mdeval" end
    },

    {
        "NFrid/due.nvim",
        lazy = true,
        ft = { "markdown" },
        event = "BufReadPost",
        config = function() require "user.due" end
    },

}
