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

    { "ellisonleao/gruvbox.nvim" },

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
        opts = require("user.flash_cfg"),
        -- config = function() require 'user.flash' end,
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash", },
            { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter", },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash", },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash Treesitter Search", },
            { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search", },
        },
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
        event = "BufEnter",
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
