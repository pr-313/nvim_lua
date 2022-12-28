-- Install your plugins here
return {
    -- My plugins here
    "wbthomason/packer.nvim",    -- Have packer manage itself
    "lewis6991/impatient.nvim",
    "nvim-lua/plenary.nvim",    -- Useful lua functions used by lots of plugins
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "kyazdani42/nvim-web-devicons",
    'alvarosevilla95/luatab.nvim',
    {"kyazdani42/nvim-tree.lua",
        cmd={"NvimTreeToggle","NvimTreeFindFile"},
        lazy=true,
        config = function () require"user.nvim-tree" end},
    "nvim-lualine/lualine.nvim",
    {"akinsho/toggleterm.nvim",
        cmd={"ToggleTerm","Lazygit"},
        lazy=true,
        config = function () require"user.toggleterm" end},

    -- "ahmedkhalf/project.nvim"                     ,

    {"lukas-reineke/indent-blankline.nvim",
        cmd={"IndentBlanklineToggle"},
        lazy=true,
        config = function () require"user.indentline" end},
    "goolord/alpha-nvim",
    "vhda/verilog_systemverilog.vim",

    -- Colorschemes
    "gruvbox-community/gruvbox",
    "folke/tokyonight.nvim",
    "lunarvim/darkplus.nvim",

    -- Haarpoon
    "ThePrimeagen/harpoon",

    -- cmp plugins
    "hrsh7th/nvim-cmp",    -- The completion plugin
    "hrsh7th/cmp-buffer",    -- buffer completions
    "hrsh7th/cmp-path",    -- path completions
    "saadparwaiz1/cmp_luasnip",    -- snippet completions
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",

    -- Jupyter
    -- "untitled-ai/jupyter_ascending.vim"           ,

    -- Fzf
    {'ibhagwan/fzf-lua',
        cmd={'FzfLua'},
        lazy=true,
        dependencies="fzf",
        config = function () require"user.fzf-lua" end},
    {'junegunn/fzf',
        build = './install --all'},

    -- Folding
    -- 'kevinhwang91/nvim-ufo'                        ,
    -- 'kevinhwang91/promise-async'                  ,

    -- snippets
    "L3MON4D3/LuaSnip",    --snippet engine
    "rafamadriz/friendly-snippets",    -- a bunch of snippets to use

    -- Clipboard ++
    "tversteeg/registers.nvim",

    -- Sessions
    'rmagatti/auto-session',

    -- LSP
    "neovim/nvim-lspconfig",    -- enable LSP
    "williamboman/nvim-lsp-installer",    -- simple to use language server installer
    -- "jose-elias-alvarez/null-ls.nvim"             ,    -- for formatters and linters
    -- "RRethy/vim-illuminate"                       ,

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    -- "nvim-treesitter/nvim-treesitter-angular"        ,

    -- Sidebar
    {"sidebar-nvim/sidebar.nvim",
        cmd={"SidebarNvimToggle"},
        lazy=true ,
        config = function() require'user.sidebar' end},
    'kevinhwang91/nvim-bqf',  -- Quickfix

    -- Misc
    {"tweekmonster/startuptime.vim", cmd={"StartupTime"}, lazy=true},
    {"mbbill/undotree", cmd={"UndotreeToggle"}, lazy=true},
    {"rlane/pounce.nvim", cmd={"Pounce"}, lazy=true ,  config = function() require'user.pounce' end},
    {"szw/vim-maximizer", cmd={"MaximizerToggle"}, lazy=true},
    {"godlygeek/tabular", cmd={"Tab"}, lazy=true},
    {"preservim/tagbar", cmd={"TagbarToggle"}, lazy=true},

    -- Git
    "lewis6991/gitsigns.nvim",
    "f-person/git-blame.nvim",
    {"sindrets/diffview.nvim", cmd={"DiffviewOpen", "DiffviewFileHistory"}, lazy=true, config = function () require('user.diffview') end},
    -- "kdheepak/lazygit.nvim"                          ,   , cmd={"LazyGit"}, lazy=true
    {"tpope/vim-fugitive", cmd={"G","Gvdiffsplit"}, lazy=true},

    -- DAP
    -- "mfussenegger/nvim-dap"                       ,
    -- "rcarriga/nvim-dap-ui"                        ,
    -- "ravenxrz/DAPInstall.nvim"                    ,

    -- Telescope
    -- "nvim-telescope/telescope.nvim"               ,
    -- 'nvim-telescope/telescope-fzf-native.nvim'     ,  run = 'make' }

}
