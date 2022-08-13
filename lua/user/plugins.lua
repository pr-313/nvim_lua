local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path, }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
    -- compile_path = require("packer.util").join_paths('~/.config/nvim_lua', 'plugin', 'packer_compiled.lua'),
    -- package_root   = require("packer.util").join_paths('~/.local/nvim/packer_all', 'site', 'pack')
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use { "wbthomason/packer.nvim"                         ,  commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" } -- Have packer manage itself
    use { "lewis6991/impatient.nvim"                       ,  commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" }
    use { "nvim-lua/plenary.nvim"                          ,  commit = "9069d14a120cadb4f6825f76821533f2babcab92" } -- Useful lua functions used by lots of plugins
    -- use { "windwp/nvim-autopairs"                       ,  commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" } -- Autopairs                                                               ,  integrates with both cmp and treesitter
    use { "numToStr/Comment.nvim"                          ,  commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }
    use { "JoosepAlviste/nvim-ts-context-commentstring"    ,  commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" }
    use { "kyazdani42/nvim-web-devicons"                   ,  commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" }
    use { "kyazdani42/nvim-tree.lua"                       ,  commit = "e6c1b4cd5be9f14c169b5dbe0665a148f8af498c" }
    -- use { "akinsho/bufferline.nvim"                     ,  commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" }
    -- use { "moll/vim-bbye"                               ,  commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
    use { "nvim-lualine/lualine.nvim"                      ,  commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" }
    use { "akinsho/toggleterm.nvim"                        ,  commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" , cmd={"ToggleTerm"}, opt=true,
                                                              config = function () require"user.toggleterm" end}
    -- use { "ahmedkhalf/project.nvim"                     ,  commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" }
    use { "lukas-reineke/indent-blankline.nvim"            ,  commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" , cmd={"IndentBlanklineToggle"}, opt=true
                                                           ,  config = function () require"user.indentline" end}
    use { "goolord/alpha-nvim"                             ,  commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" }
    use {"vhda/verilog_systemverilog.vim"                  ,  commit ="e63a6d7093ab4a483eac7479e7d9ae8efff67472"}

    -- Colorschemes
    use { "gruvbox-community/gruvbox"                      ,  commit = "34ad436b234c5095d46bb065c5b32780618df83f" }
    use { "folke/tokyonight.nvim"                          ,  commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
    use { "lunarvim/darkplus.nvim"                         ,  commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }

    -- Harpoon
    use {"ThePrimeagen/harpoon"                            ,  commit ="d3d3d22b6207f46f8ca64946f4d781e975aec0fc"}

    -- cmp plugins
    use { "hrsh7th/nvim-cmp"                               ,  commit = "433af3dffce64cbd3f99bdac9734768a6cc41951" } -- The completion plugin
    use { "hrsh7th/cmp-buffer"                             ,  commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" } -- buffer completions
    use { "hrsh7th/cmp-path"                               ,  commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" } -- path completions
    use { "saadparwaiz1/cmp_luasnip"                       ,  commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp"                           ,  commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
    use { "hrsh7th/cmp-nvim-lua"                           ,  commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
    use { "hrsh7th/cmp-cmdline"                            ,  commit ="c36ca4bc1dedb12b4ba6546b96c43896fd6e7252"}

    -- Jupyter
    -- use { "untitled-ai/jupyter_ascending.vim"           ,  commit = "69652a47765daf110ad16e04d57f04fac6ceef81"}

    -- Fzf
    use { 'ibhagwan/fzf-lua'                               ,  commit = "341f0641ea4b0bd1cb798d7138f1a84c90848b02", cmd={'FzfLua'}, opt=true
                                                           ,  config = function () require"user.fzf-lua" end}
    use { 'junegunn/fzf'                                   ,  commit = "ecc418ba77e52660ffdd9ed84727b12c3f377680", run = './install --all'}

    -- Folding
    -- use {'kevinhwang91/nvim-ufo'                        ,  commit = "d99d72253ce615d66e41660f68255ff2f65b4cf8" }
    -- use { 'kevinhwang91/promise-async'                  ,  commit = "1a30ecd708b08adaa7de8ad3d207147aadf3e081"}

    -- snippets
    use { "L3MON4D3/LuaSnip"                               ,  commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" } --snippet engine
    use { "rafamadriz/friendly-snippets"                   ,  commit = "d27a83a363e61009278b6598703a763ce9c8e617" } -- a bunch of snippets to use

    -- Clipboard ++
    use { "tversteeg/registers.nvim"                       ,  commit = "f354159d34bc17553ad772c633fd7caff8ecb35c" }

    -- Sessions
    use { 'rmagatti/auto-session'                          ,  commit = "50f5f2eaa7ff825c7036dc3c9981ebae7584b48e" }

    -- LSP
    use { "neovim/nvim-lspconfig"                          ,  commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" } -- enable LSP
    use { "williamboman/nvim-lsp-installer"                ,  commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
    -- use { "jose-elias-alvarez/null-ls.nvim"             ,  commit = "ff40739e5be6581899b43385997e39eecdbf9465" } -- for formatters and linters
    -- use { "RRethy/vim-illuminate"                       ,  commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter"                ,  commit = "518e27589c0463af15463c9d675c65e464efc2fe"}
    use { "nvim-treesitter/nvim-treesitter-angular"        ,  commit = "53d55ba0473c3ac58e25ce3d016a0409481c645c"}

    -- Sidebar
    use { "sidebar-nvim/sidebar.nvim"                      ,  commit = "4e07c8ea5cc86e21d69bb000f9f8e5df536da8b4" , cmd={"SidebarNvimToggle"}, opt=true
                                                           ,  config = function() require'user.sidebar' end}

    -- Quickfix
    use {'kevinhwang91/nvim-bqf'                           ,  commit = "8b62211ad7529c314e80b22968eef6ba275c781c"}

    -- Misc
    use {"dstein64/vim-startuptime"                        ,  commit = "82c8a5491e13fa307fb2cb47182a30560f930377"}
    use {"mbbill/undotree"                                 ,  commit = "08e259be24d4476c1ee745dc735eefd44f90efdc" , cmd={"UndotreeToggle"}, opt=true}
    use {"rlane/pounce.nvim"                               ,  commit = "fab6ab7b80f6c2716fc5b0afca1a77408a1d7675" , cmd={"Pounce"}, opt=true
                                                           ,  config = function() require'user.pounce' end}
    use { "szw/vim-maximizer"                              ,  commit = "2e54952fe91e140a2e69f35f22131219fcd9c5f1" , cmd={"MaximizerToggle"}, opt=true}
    use { "godlygeek/tabular"                              ,  commit = "339091ac4dd1f17e225fe7d57b48aff55f99b23a" }
    use { "preservim/tagbar"                               ,  commit = "0243b19920a683df531f19bb7fb80c0ff83927dd" , cmd={"TagbarToggle"}, opt=true}

    -- Git
    use { "lewis6991/gitsigns.nvim"                        ,  commit = "c18e016864c92ecf9775abea1baaa161c28082c3" }
    use { "sindrets/diffview.nvim"                         ,  commit = "2e77bedfe11f52621fad1d8c20ffbddd8e36d137" }
    use { "kdheepak/lazygit.nvim"                          ,  commit = "9c73fd69a4c1cb3b3fc35b741ac968e331642600" , cmd={"LazyGit"}, opt=true}
    use { "tpope/vim-fugitive"                             ,  commit = "80cd9c876e56c70135643601fe08e30010eb88dc" , cmd={"G","Gvdiffsplit"}, opt=true}

    -- DAP
    -- use { "mfussenegger/nvim-dap"                       ,  commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" }
    -- use { "rcarriga/nvim-dap-ui"                        ,  commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" }
    -- use { "ravenxrz/DAPInstall.nvim"                    ,  commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

    -- Telescope
    -- use { "nvim-telescope/telescope.nvim"               ,  commit = "8b02088743c07c2f82aec2772fbd2b3774195448" }
    -- use {'nvim-telescope/telescope-fzf-native.nvim'     ,  run = 'make' }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
