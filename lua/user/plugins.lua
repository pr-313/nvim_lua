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
    use { "wbthomason/packer.nvim"                          } -- Have packer manage itself
    use { "lewis6991/impatient.nvim"                        }
    use { "nvim-lua/plenary.nvim"                           } -- Useful lua functions used by lots of plugins
    -- use { "windwp/nvim-autopairs"                        } -- Autopairs, integrates with both cmp and treesitter
    use { "numToStr/Comment.nvim"                           }
    use { "JoosepAlviste/nvim-ts-context-commentstring"     }
    use { "kyazdani42/nvim-web-devicons"                    }
    -- use { "romgrk/barbar.nvim"                              }
    use { 'alvarosevilla95/luatab.nvim'                     }
    use { "kyazdani42/nvim-tree.lua"                       , cmd={"NvimTreeToggle","NvimTreeFindFile"}, opt=true
                                                           ,  config = function () require"user.nvim-tree" end}
    -- use { "moll/vim-bbye"                                }
    use { "nvim-lualine/lualine.nvim"                       }
    use { "akinsho/toggleterm.nvim"                         , cmd={"ToggleTerm","Lazygit"}, opt=true,
                                                              config = function () require"user.toggleterm" end}
    -- use { "ahmedkhalf/project.nvim"                      }
    use { "lukas-reineke/indent-blankline.nvim"             , cmd={"IndentBlanklineToggle"}, opt=true
                                                           ,  config = function () require"user.indentline" end}
    use { "goolord/alpha-nvim"                              }
    use {"vhda/verilog_systemverilog.vim"                   }

    -- Colorschemes
    use { "gruvbox-community/gruvbox"                       }
    use { "folke/tokyonight.nvim"                           }
    use { "lunarvim/darkplus.nvim"                          }

    -- Harpoon
    use {"ThePrimeagen/harpoon"                             }

    -- cmp plugins
    use { "hrsh7th/nvim-cmp"                                } -- The completion plugin
    use { "hrsh7th/cmp-buffer"                              } -- buffer completions
    use { "hrsh7th/cmp-path"                                } -- path completions
    use { "saadparwaiz1/cmp_luasnip"                        } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp"                            }
    use { "hrsh7th/cmp-nvim-lua"                            }
    use { "hrsh7th/cmp-cmdline"                             }

    -- Jupyter
    -- use { "untitled-ai/jupyter_ascending.vim"           }

    -- Fzf
    use { 'ibhagwan/fzf-lua'                               , cmd={'FzfLua'}, opt=true
                                                           ,  config = function () require"user.fzf-lua" end}
    use { 'junegunn/fzf'                                   , run = './install --all'}

    -- Folding
    -- use {'kevinhwang91/nvim-ufo'                         }
    -- use { 'kevinhwang91/promise-async'                  }

    -- snippets
    use { "L3MON4D3/LuaSnip"                                } --snippet engine
    use { "rafamadriz/friendly-snippets"                    } -- a bunch of snippets to use

    -- Clipboard ++
    use { "tversteeg/registers.nvim"                        }

    -- Sessions
    use { 'rmagatti/auto-session'                           }

    -- LSP
    use { "neovim/nvim-lspconfig"                           } -- enable LSP
    use { "williamboman/nvim-lsp-installer"                 } -- simple to use language server installer
    -- use { "jose-elias-alvarez/null-ls.nvim"              } -- for formatters and linters
    -- use { "RRethy/vim-illuminate"                        }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter"                }
    -- use { "nvim-treesitter/nvim-treesitter-angular"        }

    -- Sidebar
    use { "sidebar-nvim/sidebar.nvim"                       , cmd={"SidebarNvimToggle"}, opt=true
                                                           ,  config = function() require'user.sidebar' end}

    -- Quickfix
    use {'kevinhwang91/nvim-bqf'                           }

    -- Misc
    use {"tweekmonster/startuptime.vim"                     , cmd={"StartupTime"}, opt=true}
    use {"mbbill/undotree"                                  , cmd={"UndotreeToggle"}, opt=true}
    use {"rlane/pounce.nvim"                                , cmd={"Pounce"}, opt=true
                                                           ,  config = function() require'user.pounce' end}
    use { "szw/vim-maximizer"                               , cmd={"MaximizerToggle"}, opt=true}
    use { "godlygeek/tabular"                               , cmd={"Tab"}, opt=true}
    use { "preservim/tagbar"                                , cmd={"TagbarToggle"}, opt=true}

    -- Git
    use { "lewis6991/gitsigns.nvim"                         }
    use { "f-person/git-blame.nvim"                         }
    use { "sindrets/diffview.nvim"                          , cmd={"DiffviewOpen", "DiffviewFileHistory"}, opt=true
                                                           ,  config = function () require('user.diffview') end}
    -- use { "kdheepak/lazygit.nvim"                           , cmd={"LazyGit"}, opt=true}
    use { "tpope/vim-fugitive"                              , cmd={"G","Gvdiffsplit"}, opt=true}

    -- DAP
    -- use { "mfussenegger/nvim-dap"                        }
    -- use { "rcarriga/nvim-dap-ui"                         }
    -- use { "ravenxrz/DAPInstall.nvim"                     }

    -- Telescope
    -- use { "nvim-telescope/telescope.nvim"                }
    -- use {'nvim-telescope/telescope-fzf-native.nvim'     ,  run = 'make' }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
