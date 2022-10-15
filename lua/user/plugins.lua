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

local util = require("packer.util")

-- Have packer use a popup window
packer.init {
    -- compile_path      = require("packer.util").join_paths('~/.config/nvim_lua', 'plugin', 'packer_compiled.lua'),
    -- package_root      = require("packer.util").join_paths('~/.local/nvim/packer_all', 'site', 'pack')
    -- snapshot_path        = util.join_paths(vim.fn.stdpath('cache'), 'packer.nvim'), -- default save directory for snapshots
    ensure_dependencies  = true, -- should packer install plugin dependencies?
    snapshot             = nil, -- name of the snapshot you would like to load at startup
    plugin_package       = 'packer', -- the default package for plugins
    max_jobs             = nil, -- limit the number of simultaneous jobs. nil means no limit
    auto_clean           = true, -- during sync(), remove unused plugins
    compile_on_sync      = true, -- during sync(), run packer.compile()
    disable_commands     = false, -- disable creating commands
    opt_default          = false, -- default to using opt (as opposed to start) plugins
    transitive_opt       = true, -- make dependencies of opt plugins also opt by default
    transitive_disable   = true, -- automatically disable dependencies of disabled plugins
    auto_reload_compiled = true, -- automatically reload the compiled file after creating it.
    -- git = {
    --     cmd = 'git', -- the base command for git operations
    --     subcommands = { -- format strings for git subcommands
    --         update         = 'pull --ff-only --progress --rebase=false',
    --         install        = 'clone --depth %i --no-single-branch --progress',
    --         fetch          = 'fetch --depth 999999 --progress',
    --         checkout       = 'checkout %s --',
    --         update_branch  = 'merge --ff-only @{u}',
    --         current_branch = 'branch --show-current',
    --         diff           = 'log --color=never --pretty=format:fmt --no-show-signature head@{1}...head',
    --         diff_fmt       = '%%h %%s (%%cr)',
    --         get_rev        = 'rev-parse --short head',
    --         get_msg        = 'log --color=never --pretty=format:fmt --no-show-signature head -n 1',
    --         submodules     = 'submodule update --init --recursive --progress'
    --     },
    --     depth              = 1, -- git clone depth
    --     clone_timeout      = 100, -- timeout, in seconds, for git clones
    --     default_url_format = 'https://github.com/%s' -- lua format string used for "aaa/bbb" style plugins
    -- },
    display = {
        non_interactive = false, -- if true, disable display windows for all operations
        open_fn         = nil, -- an optional function to open a window for packer's display
        open_cmd        = '65vnew \\[packer\\]', -- an optional command to open a window for packer's display
        working_sym     = '⟳', -- the symbol for a plugin being installed/updated
        error_sym       = '✗', -- the symbol for a plugin with an error in installation/updating
        done_sym        = '✓', -- the symbol for a plugin which has completed installation/updating
        removed_sym     = '-', -- the symbol for an unused plugin which was removed
        moved_sym       = '→', -- the symbol for a plugin which was moved (e.g. from opt to start)
        header_sym      = '━', -- the symbol for the header line in packer's display
        show_all_info   = true, -- should packer show all update details automatically?
        prompt_border   = 'double', -- border style of prompt popups.
        keybindings     = { -- keybindings for the display window
            quit          = 'q',
            toggle_info   = '<cr>',
            diff          = 'd',
            prompt_revert = 'r',
        }
    },
    luarocks   = { python_cmd = 'python' }, -- set the python command to use for running hererocks 
    log        = { level = 'warn' }, -- the default print log level. one of: "trace", "debug", "info", "warn", "error", "fatal".
    profile    = { enable = false, threshold = 1 },-- integer in milliseconds, plugins which load faster than this won't be shown in profile output
    autoremove = false, -- remove disabled or unused plugins without prompting the user
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use { "wbthomason/packer.nvim"                         ,  commit = "6afb674" } -- Have packer manage itself
    use { "lewis6991/impatient.nvim"                       ,  commit = "b842e16" }
    use { "nvim-lua/plenary.nvim"                          ,  commit = "4b7e520" } -- Useful lua functions used by lots of plugins
    -- use { "windwp/nvim-autopairs"                       ,  commit = "" } -- Autopairs, integrates with both cmp and treesitter
    use { "numToStr/Comment.nvim"                          ,  commit = "ad7ffa8" }
    use { "JoosepAlviste/nvim-ts-context-commentstring"    ,  commit = "2941f00" }
    use { "kyazdani42/nvim-web-devicons"                   ,  commit = "a8cf88c" }
    -- use { "romgrk/barbar.nvim"                             ,  commit = "" }
    use { 'alvarosevilla95/luatab.nvim'                    ,  commit = "79d53c1" }
    use { "kyazdani42/nvim-tree.lua"                       ,  commit = "c446527", cmd={"NvimTreeToggle","NvimTreeFindFile"}, opt=true
                                                           ,  config = function () require"user.nvim-tree" end}
    -- use { "moll/vim-bbye"                               ,  commit = "" }
    use { "nvim-lualine/lualine.nvim"                      ,  commit = "edca2b0" }
    use { "akinsho/toggleterm.nvim"                        ,  commit = "2a787c4" , cmd={"ToggleTerm","Lazygit"}, opt=true,
                                                              config = function () require"user.toggleterm" end}
    -- use { "ahmedkhalf/project.nvim"                     ,  commit = "" }
    use { "lukas-reineke/indent-blankline.nvim"            ,  commit = "db7cbcb" , cmd={"IndentBlanklineToggle"}, opt=true
                                                           ,  config = function () require"user.indentline" end}
    use { "goolord/alpha-nvim"                             ,  commit = "0bb6fc0" }
    use {"vhda/verilog_systemverilog.vim"                  ,  commit = "0141e62" }

    -- Colorschemes
    use { "gruvbox-community/gruvbox"                      ,  commit = "95b120a" }
    use { "folke/tokyonight.nvim"                          ,  commit = "e6307e1" }
    use { "lunarvim/darkplus.nvim"                         ,  commit = "f20cba5" }

    -- Harpoon
    use {"ThePrimeagen/harpoon"                            ,  commit = "4dfe94e" }

    -- cmp plugins
    use { "hrsh7th/nvim-cmp"                               ,  commit = "3347dd3" } -- The completion plugin
    use { "hrsh7th/cmp-buffer"                             ,  commit = "3022dbc" } -- buffer completions
    use { "hrsh7th/cmp-path"                               ,  commit = "91ff86c" } -- path completions
    use { "saadparwaiz1/cmp_luasnip"                       ,  commit = "a9de941" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp"                           ,  commit = "3cf38d9" }
    use { "hrsh7th/cmp-nvim-lua"                           ,  commit = "d276254" }
    use { "hrsh7th/cmp-cmdline"                            ,  commit = "c66c379" }

    -- Jupyter
    -- use { "untitled-ai/jupyter_ascending.vim"           ,  commit = ""}

    -- Fzf
    use { 'ibhagwan/fzf-lua'                               ,  commit = "025d8c5", cmd={'FzfLua'}, opt=true
                                                           ,  config = function () require"user.fzf-lua" end}
    use { 'junegunn/fzf'                                   ,  commit = "f9d5330", run = './install --all'}

    -- Folding
    -- use {'kevinhwang91/nvim-ufo'                        ,  commit = "" }
    -- use { 'kevinhwang91/promise-async'                  ,  commit = ""}

    -- snippets
    use { "L3MON4D3/LuaSnip"                               ,  commit = "663d544" } --snippet engine
    use { "rafamadriz/friendly-snippets"                   ,  commit = "fd16b4d" } -- a bunch of snippets to use

    -- Clipboard ++
    use { "tversteeg/registers.nvim"                       ,  commit = "a87a7c5" }

    -- Sessions
    use { 'rmagatti/auto-session'                          ,  commit = "39319bf" }

    -- LSP
    use { "neovim/nvim-lspconfig"                          ,  commit = "35a731b" } -- enable LSP
    use { "williamboman/nvim-lsp-installer"                ,  commit = "23820a8" } -- simple to use language server installer
    -- use { "jose-elias-alvarez/null-ls.nvim"             ,  commit = "" } -- for formatters and linters
    -- use { "RRethy/vim-illuminate"                       ,  commit = "" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter"                ,  commit = "addc129a"}
    -- use { "nvim-treesitter/nvim-treesitter-angular"        ,  commit = ""}

    -- Sidebar
    use { "sidebar-nvim/sidebar.nvim"                      ,  commit = "990ce5f" , cmd={"SidebarNvimToggle"}, opt=true
                                                           ,  config = function() require'user.sidebar' end}

    -- Quickfix
    use {'kevinhwang91/nvim-bqf'                           ,  commit = "c33b5c5"}

    -- Misc
    use {"tweekmonster/startuptime.vim"                    ,  commit = "dfa57f5" , cmd={"StartupTime"}, opt=true}
    use {"mbbill/undotree"                                 ,  commit = "bd60cb5" , cmd={"UndotreeToggle"}, opt=true}
    use {"rlane/pounce.nvim"                               ,  commit = "a573820" , cmd={"Pounce"}, opt=true
                                                           ,  config = function() require'user.pounce' end}
    use { "szw/vim-maximizer"                              ,  commit = "2e54952" , cmd={"MaximizerToggle"}, opt=true}
    use { "godlygeek/tabular"                              ,  commit = "339091a" , cmd={"Tab"}, opt=true}
    use { "preservim/tagbar"                               ,  commit = "83933d5" , cmd={"TagbarToggle"}, opt=true}

    -- Git
    use { "lewis6991/gitsigns.nvim"                        ,  commit = "2c6f96d" }
    use { "f-person/git-blame.nvim"                        ,  commit = "08e75b7" }
    use { "sindrets/diffview.nvim"                         ,  commit = "a1fbcaa" , cmd={"DiffviewOpen", "DiffviewFileHistory"}, opt=true
                                                           ,  config = function () require('user.diffview') end}
    -- use { "kdheepak/lazygit.nvim"                          ,  commit = "9c73fd6" , cmd={"LazyGit"}, opt=true}
    use { "tpope/vim-fugitive"                             ,  commit = "dd8107c" , cmd={"G","Gvdiffsplit"}, opt=true}

    -- DAP
    -- use { "mfussenegger/nvim-dap"                       ,  commit = "" }
    -- use { "rcarriga/nvim-dap-ui"                        ,  commit = "" }
    -- use { "ravenxrz/DAPInstall.nvim"                    ,  commit = "" }

    -- Telescope
    -- use { "nvim-telescope/telescope.nvim"               ,  commit = "" }
    -- use {'nvim-telescope/telescope-fzf-native.nvim'     ,  run = 'make' }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
