return {
    -- Utilities
    { "nvim-lua/plenary.nvim",          lazy = true },
    "nvim-tree/nvim-web-devicons",
    "junegunn/vim-easy-align",

    -- Which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.setup({ delay = 500 })
            wk.add({
                { "<leader>a", group = "Claude" },
                { "<leader>h", group = "Git hunks" },
                { "<leader>g", group = "Git" },
                { "<leader>l", group = "LSP" },
                { "<leader>c", group = "Comment / Conflict" },
            })
        end,
    },

    -- Claude Code
    { "coder/claudecode.nvim", config = true },

    -- File tree
    { "kyazdani42/nvim-tree.lua",        lazy = true, cmd = { "NvimTreeToggle", "NvimTreeFindFile" }, config = function() require "user.nvim-tree" end },

    -- UI
    "nvim-lualine/lualine.nvim",
    "goolord/alpha-nvim",
    { "lukas-reineke/indent-blankline.nvim", lazy = true, cmd = { "IndentBlanklineToggle" }, config = function() require "user.indentline" end },

    -- Terminal
    { "akinsho/toggleterm.nvim",         lazy = true, cmd = { "ToggleTerm", "LG" }, config = function() require "user.toggleterm" end },

    -- Motion
    { "rlane/pounce.nvim",               lazy = true, cmd = { "Pounce" }, config = function() require "user.pounce" end },

    -- Editing helpers
    { "numToStr/Comment.nvim",           lazy = true, event = "BufReadPost", config = function() require "user.comment" end },
    { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
    { "mbbill/undotree",                 lazy = true, cmd = { "UndotreeToggle" } },
    { "godlygeek/tabular",               lazy = true, cmd = { "Tab" } },
    { "folke/todo-comments.nvim",        lazy = true, event = "BufReadPost", dependencies = { "nvim-lua/plenary.nvim" }, config = function() require "user.todo_comment" end },
    { "tweekmonster/startuptime.vim",    lazy = true, cmd = { "StartupTime" } },
    { "stevearc/oil.nvim",               dependencies = { "nvim-tree/nvim-web-devicons" }, config = function() require "user.oil" end },

    -- Colorschemes
    { "gruvbox-community/gruvbox",       lazy = true },
    { "folke/tokyonight.nvim",           lazy = true },
    { "rebelot/kanagawa.nvim",           lazy = true },

    -- Completion
    { "hrsh7th/nvim-cmp",                lazy = true, event = "BufReadPost", config = function() require "user.cmp" end },
    { "hrsh7th/cmp-buffer",              lazy = true, event = "BufReadPost", dependencies = { "nvim-cmp" } },
    { "hrsh7th/cmp-path",                lazy = true, event = "BufReadPost", dependencies = { "nvim-cmp" } },
    { "saadparwaiz1/cmp_luasnip",        lazy = true, event = "BufReadPost", dependencies = { "nvim-cmp" } },
    { "hrsh7th/cmp-nvim-lsp",            lazy = true, event = "BufReadPost", dependencies = { "nvim-cmp" } },
    { "hrsh7th/cmp-nvim-lua",            lazy = true, event = "BufReadPost", dependencies = { "nvim-cmp" } },
    { "hrsh7th/cmp-cmdline",             lazy = true, event = "CmdlineEnter", dependencies = { "nvim-cmp" } },
    { "L3MON4D3/LuaSnip",               lazy = true, event = "BufReadPost" },
    { "rafamadriz/friendly-snippets",    lazy = true, event = "BufReadPost" },

    -- Fuzzy finder
    { "ibhagwan/fzf-lua",                lazy = true, cmd = { "FzfLua" }, dependencies = "fzf", config = function() require "user.fzf-lua" end },
    { "junegunn/fzf",                    build = "./install --all", lazy = true },

    -- Formatting
    {
        "stevearc/conform.nvim",
        lazy = true,
        event = "BufWritePre",
        cmd = { "ConformInfo" },
        config = function() require "user.conform" end,
    },

    -- LSP
    { "neovim/nvim-lspconfig",           lazy = true, event = "BufReadPre", dependencies = "mason.nvim", config = function() require "user.lsp" end },
    { "williamboman/mason.nvim",         lazy = true, cmd = { "Mason" }, dependencies = { "mason-lspconfig.nvim" }, config = function() require "user.lsp.lsp-installer" end, event = "BufReadPre" },
    { "williamboman/mason-lspconfig.nvim", lazy = true },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", lazy = true, event = "BufReadPre", config = function() require "user.treesitter" end },

    -- Git
    { "lewis6991/gitsigns.nvim",         lazy = true, event = "BufReadPost", config = function() require "user.gitstuff" end },
    { "sindrets/diffview.nvim",          lazy = true, cmd = { "DiffviewOpen", "DiffviewFileHistory" }, config = function() require "user.diffview" end },

    -- Misc
    { "RRethy/vim-illuminate",           lazy = true, event = "BufReadPost", config = function() require "user.illuminate" end },
}
