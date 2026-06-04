return {
    -- Utilities
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "junegunn/vim-easy-align",

    -- Tabs
    { "alvarosevilla95/luatab.nvim",     lazy = true, event = "TabNew",   config = function() require "user.bufferline" end },

    -- File tree
    { "kyazdani42/nvim-tree.lua",        lazy = true, cmd = { "NvimTreeToggle", "NvimTreeFindFile" }, config = function() require "user.nvim-tree" end },

    -- UI
    "nvim-lualine/lualine.nvim",
    "goolord/alpha-nvim",
    { "lukas-reineke/indent-blankline.nvim", lazy = true, cmd = { "IndentBlanklineToggle" }, config = function() require "user.indentline" end },
    { "szw/vim-maximizer",               lazy = true, cmd = { "MaximizerToggle" } },

    -- Terminal
    { "akinsho/toggleterm.nvim",         lazy = true, cmd = { "ToggleTerm", "LG" }, config = function() require "user.toggleterm" end },

    -- Motion
    { "rlane/pounce.nvim",               lazy = true, cmd = { "Pounce" }, config = function() require "user.pounce" end },

    -- Editing helpers
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    { "mbbill/undotree",                 lazy = true, cmd = { "UndotreeToggle" } },
    { "godlygeek/tabular",               lazy = true, cmd = { "Tab" } },
    { "preservim/tagbar",                lazy = true, cmd = { "TagbarToggle" } },
    { "folke/todo-comments.nvim",        lazy = true, event = "BufEnter", dependencies = { "nvim-lua/plenary.nvim" }, config = function() require "user.todo_comment" end },
    { "tweekmonster/startuptime.vim",    lazy = true, cmd = { "StartupTime" } },
    { "stevearc/oil.nvim",               dependencies = { "nvim-tree/nvim-web-devicons" }, config = function() require "user.oil" end },

    -- Quickfix
    { "kevinhwang91/nvim-bqf",           lazy = true, ft = "qf", event = "QuickFixCmdPost", config = function() require "user.quickfix" end },

    -- Markdown
    { "NFrid/due.nvim",                  lazy = true, ft = { "markdown" }, config = function() require "user.due" end },

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

    -- LSP
    { "neovim/nvim-lspconfig",           lazy = true, event = "BufReadPre", dependencies = "mason.nvim", config = function() require "user.lsp" end },
    { "williamboman/mason.nvim",         lazy = true, cmd = { "Mason" }, dependencies = { "mason-lspconfig.nvim" }, config = function() require "user.lsp.lsp-installer" end, event = "BufReadPre" },
    { "williamboman/mason-lspconfig.nvim", lazy = true },
    { "jay-babu/mason-null-ls.nvim",     dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" }, config = function() require "user.lsp.null-ls" end },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", lazy = true, event = "BufReadPre", config = function() require "user.treesitter" end },

    -- Git
    { "lewis6991/gitsigns.nvim",         lazy = true, event = "BufReadPost", config = function() require "user.gitstuff" end },
    { "sindrets/diffview.nvim",          lazy = true, cmd = { "DiffviewOpen", "DiffviewFileHistory" }, config = function() require "user.diffview" end },
    { "tpope/vim-fugitive",              lazy = true, cmd = { "G", "Gvdiffsplit" } },

    -- Misc
    { "RRethy/vim-illuminate",           lazy = true, event = "BufReadPost", config = function() require "user.illuminate" end },
    { "sidebar-nvim/sidebar.nvim",       lazy = true, cmd = { "SidebarNvimToggle" }, config = function() require "user.sidebar" end },
}
