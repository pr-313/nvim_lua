-- Install your plugins here
return {
    -- My plugins here
    "lewis6991/impatient.nvim",
    "nvim-lua/plenary.nvim",    -- Useful lua functions used by lots of plugins
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "kyazdani42/nvim-web-devicons",
    {'alvarosevilla95/luatab.nvim', lazy=true, event="TabNew",
        config = function () require"user.bufferline" end},
    {"kyazdani42/nvim-tree.lua", cmd={"NvimTreeToggle","NvimTreeFindFile"}, lazy=true,
        config = function () require"user.nvim-tree" end},
    "nvim-lualine/lualine.nvim",
    {"akinsho/toggleterm.nvim", cmd={"ToggleTerm","LG"}, lazy=true,
        config = function () require"user.toggleterm" end},

    -- "ahmedkhalf/project.nvim"                     ,

    {"lukas-reineke/indent-blankline.nvim", cmd={"IndentBlanklineToggle"}, lazy=true,
        config = function () require"user.indentline" end},
    "goolord/alpha-nvim",
    {"vhda/verilog_systemverilog.vim", lazy=true, ft={"verilog_systemverilog", "verilog", "systemverilog"}},

    -- Colorschemes
    {"gruvbox-community/gruvbox", lazy=true},
    {"folke/tokyonight.nvim", lazy=true},
    {"lunarvim/darkplus.nvim", lazy=true},

    -- Haarpoon
    {"ThePrimeagen/harpoon", lazy=true, event="VeryLazy",
        config = function () require"user.harpoon" end},
    -- cmp plugins

    {"hrsh7th/nvim-cmp", lazy=true, event="BufReadPost",
        config = function() require("user.cmp") end},
    {"hrsh7th/cmp-buffer"       , lazy=true , event="BufReadPost"  , dependencies={"nvim-cmp"}} ,
    {"hrsh7th/cmp-path"         , lazy=true , event="BufReadPost"  , dependencies={"nvim-cmp"}} ,
    {"saadparwaiz1/cmp_luasnip" , lazy=true , event="BufReadPost"  , dependencies={"nvim-cmp"}} ,
    {"hrsh7th/cmp-nvim-lsp"     , lazy=true , event="BufReadPost"  , dependencies={"nvim-cmp"}} ,
    {"hrsh7th/cmp-nvim-lua"     , lazy=true , event="BufReadPost"  , dependencies={"nvim-cmp"}} ,
    {"hrsh7th/cmp-cmdline"      , lazy=true , event="CmdlineEnter" , dependencies={"nvim-cmp"}} ,

    -- Jupyter
    -- "untitled-ai/jupyter_ascending.vim"           ,

    -- Fzf
    {'ibhagwan/fzf-lua', cmd={'FzfLua'}, lazy=true, dependencies="fzf",
        config = function () require"user.fzf-lua" end},
    {'junegunn/fzf', build = './install --all', lazy=true},

    -- Folding
    -- 'kevinhwang91/nvim-ufo'                        ,
    -- 'kevinhwang91/promise-async'                  ,

    -- snippets
    {"L3MON4D3/LuaSnip", lazy=true, event="BufReadPost"},    --snippet engine
    {"rafamadriz/friendly-snippets", lazy=true, event="BufReadPost"},   -- a bunch of snippets to use

    -- Clipboard ++
    "tversteeg/registers.nvim",

    -- Sessions
    'rmagatti/auto-session',

    -- LSP
    {"neovim/nvim-lspconfig", lazy=true, event="BufReadPre"},
    {"williamboman/mason.nvim", lazy=true, cmd={"Mason"}, dependencies={"mason-lspconfig.nvim"},
        config = function () require("user.lsp.lsp-installer") end, event="BufEnter"},    -- simple to use language server installer
    {"williamboman/mason-lspconfig.nvim", lazy=true},
    -- "jose-elias-alvarez/null-ls.nvim"             ,    -- for formatters and linters
    -- "RRethy/vim-illuminate"                       ,

    -- Treesitter
    {"nvim-treesitter/nvim-treesitter", lazy=true, event="BufReadPre",
        config = function() require "user.treesitter" end},
    -- "nvim-treesitter/nvim-treesitter-angular"        ,

    -- Sidebar
    {"sidebar-nvim/sidebar.nvim", cmd={"SidebarNvimToggle"}, lazy=true ,
        config = function() require'user.sidebar' end},
    {'kevinhwang91/nvim-bqf', lazy=true, ft="qf", event="QuickFixCmdPost",
        config= function() require "user.quickfix" end },  -- Quickfix

    -- Misc
    {"tweekmonster/startuptime.vim", cmd={"StartupTime"}, lazy=true},
    {"mbbill/undotree", cmd={"UndotreeToggle"}, lazy=true},
    {"rlane/pounce.nvim", cmd={"Pounce"}, lazy=true ,  config = function() require'user.pounce' end},
    {"szw/vim-maximizer", cmd={"MaximizerToggle"}, lazy=true},
    {"godlygeek/tabular", cmd={"Tab"}, lazy=true},
    {"preservim/tagbar", cmd={"TagbarToggle"}, lazy=true},
    --[[ {"folke/noice.nvim", lazy=true, event="VeryLazy", dependencies={"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"}, ]]
    --[[     config = function() require("user.noice") end}, ]]

    -- Git
    {"lewis6991/gitsigns.nvim", lazy=true, event="BufReadPost",
        config = function() require("user.gitstuff") end},
    {"f-person/git-blame.nvim", lazy=true, event="BufEnter"},
    {"sindrets/diffview.nvim", cmd={"DiffviewOpen", "DiffviewFileHistory"}, lazy=true, config = function () require('user.diffview') end},
    -- "kdheepak/lazygit.nvim"                          ,   , cmd={"LazyGit"}, lazy=true
    {"tpope/vim-fugitive", cmd={"G","Gvdiffsplit"}, lazy=true},

    -- Note Taking
    { 'phaazon/mind.nvim', branch = 'v2.2', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require'user.mind' end
    }

    -- DAP
    -- "mfussenegger/nvim-dap"                       ,
    -- "rcarriga/nvim-dap-ui"                        ,
    -- "ravenxrz/DAPInstall.nvim"                    ,

    -- Telescope
    -- "nvim-telescope/telescope.nvim"               ,
    -- 'nvim-telescope/telescope-fzf-native.nvim'     ,  run = 'make'

}
