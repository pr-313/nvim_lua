vim.opt.backup        = false
vim.opt.cmdheight     = 1
vim.opt.completeopt   = { "menuone", "noselect" }
vim.opt.conceallevel  = 0
vim.opt.fileencoding  = "utf-8"
vim.opt.hlsearch      = true
vim.opt.ignorecase    = true
vim.opt.mouse         = "a"
vim.opt.pumheight     = 10
vim.opt.showmode      = false
vim.opt.showtabline   = 1
vim.opt.smartcase     = true
vim.opt.smartindent   = true
vim.opt.autoindent    = true
vim.opt.splitbelow    = true
vim.opt.splitright    = true
vim.opt.swapfile      = false
vim.opt.termguicolors = true
vim.opt.guicursor     = ""
vim.opt.timeoutlen    = 1000
vim.opt.undofile      = true
vim.opt.undolevels    = 10000
vim.opt.updatetime    = 200
vim.opt.writebackup   = false
vim.opt.expandtab     = true
vim.opt.shiftwidth    = 4
vim.opt.tabstop       = 4
vim.opt.cursorline    = true
vim.opt.number        = true
vim.opt.laststatus    = 3
vim.opt.showcmd       = true
vim.opt.foldlevel     = 99  -- open all folds on file open
vim.opt.ruler         = false
vim.opt.autoread      = true
vim.opt.autowrite     = true  -- auto-save when switching buffers
vim.opt.numberwidth   = 4
vim.opt.signcolumn    = "yes"
vim.opt.wrap          = false
vim.opt.scrolloff     = 8
vim.opt.sidescrolloff = 8
vim.opt.virtualedit   = "block"    -- free cursor movement in visual block
vim.opt.confirm       = true       -- prompt on unsaved exit instead of erroring
vim.opt.inccommand    = "nosplit"  -- live preview for :s substitutions
vim.opt.grepprg       = "rg --vimgrep"
vim.opt.grepformat    = "%f:%l:%c:%m"
vim.opt.wildmode      = "longest:full,full"
vim.opt.keymodel      = { "startsel", "stopsel" }
vim.opt.fillchars     = { eob = " ", diff = "╱" }
vim.opt.nrformats     = { "alpha", "hex", "bin" }
vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")

-- skip clipboard sync inside SSH; OSC 52 handles it
vim.opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"

-- disable unused providers (suppresses checkhealth warnings)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
