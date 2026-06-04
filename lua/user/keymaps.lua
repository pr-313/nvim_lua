local keymap = vim.keymap.set
local opts   = { noremap = true, silent = true }

keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<M-H>", "20zh",   opts)
keymap("n", "<M-L>", "20zl",   opts)

-- Resize (tmux-aware)
keymap("n", "<M-k>", ":call TmuxResize('k', 4)<CR>", opts)
keymap("n", "<M-j>", ":call TmuxResize('j', 4)<CR>", opts)
keymap("n", "<M-h>", ":call TmuxResize('h', 4)<CR>", opts)
keymap("n", "<M-l>", ":call TmuxResize('l', 4)<CR>", opts)

-- Quick write / quit
keymap("n", "<leader>q", ":q<CR>",        opts)
keymap("n", "<leader>Q", ":qa<CR>",       opts)
keymap("n", "<leader>w", ":w<CR>",        opts)
keymap("n", "<leader>t", ":tabnew<CR>",   opts)
keymap("n", "<S-l>",     ":tabnext<CR>",  opts)
keymap("n", "<S-h>",     ":tabprevious<CR>", opts)

-- Search
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<M-s>", "<cmd>nohlsearch<CR>", opts)

-- Delete to black hole
keymap("n", "<leader>d", "V\"_d", opts)
keymap("v", "<leader>d", "\"_d",  opts)

-- Oil file browser
keymap("n", "<C-p>", ":Oil --float<CR>", opts)

-- Window maximizer (native lua, no plugin)
keymap("n", "<leader><leader>", function()
    if vim.t._maximized then
        vim.cmd("wincmd =")
        vim.t._maximized = false
    else
        vim.cmd("wincmd |")
        vim.cmd("wincmd _")
        vim.t._maximized = true
    end
end, opts)

-- Folding
keymap("n", "<Space>", "za", opts)
keymap("v", "<Space>", "zf", opts)

-- Move lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Align
keymap("n", "ga", "<Plug>(EasyAlign)", opts)
keymap("x", "ga", "<Plug>(EasyAlign)", opts)

-- Quickfix
keymap("n", "<M-m>", ":copen<CR>",    opts)
keymap("n", "<M-b>", ":cprevious<CR>", opts)
keymap("n", "<M-n>", ":cnext<CR>",    opts)

-- View persistence
keymap("n", "<M-M>", ":mkview<CR>",   opts)
keymap("n", "<M-R>", ":loadview<CR>", opts)

-- Quick visual find
keymap("v", "<leader>g", "y/<C-r>\"<cr>")

-- Undo breaks on punctuation
keymap("i", ",",     ",<c-g>u",    opts)
keymap("i", ".",     ".<c-g>u",    opts)
keymap("i", "!",     "!<c-g>u",    opts)
keymap("i", "?",     "?<c-g>u",    opts)
keymap("i", ";",     ";<c-g>u",    opts)
keymap("i", "<CR>",  "<CR><c-g>u", opts)
keymap("i", "<space>", "<space><c-g>u", opts)
keymap("n", "tu", ":UndotreeToggle<CR>", opts)

-- Clipboard
keymap("n", "<leader>y", "\"+y", opts)
keymap("n", "Y",          "y$",  opts)
keymap("n", "<leader>p", "\"+p", opts)
keymap("v", "<leader>y", "\"+y", opts)
keymap("v", "<leader>r", "y:%s@<C-r>\"@")

-- Toggles
keymap("n", "<leader>W", ":set wrap! wrap?<CR>",     opts)
keymap("n", "<leader>H", ":set hlsearch! hlsearch?<CR>", opts)

-- Close buffer
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Claude Code
keymap("n", "<Leader>ac", "<cmd>ClaudeCode<CR>",            opts)
keymap("n", "<Leader>af", "<cmd>ClaudeCodeFocus<CR>",       opts)
keymap("n", "<Leader>ar", "<cmd>ClaudeCode --resume<CR>",   opts)
keymap("n", "<Leader>aC", "<cmd>ClaudeCode --continue<CR>", opts)
keymap("n", "<Leader>am", "<cmd>ClaudeCodeSelectModel<CR>", opts)
keymap("n", "<Leader>ab", "<cmd>ClaudeCodeAdd %<CR>",       opts)
keymap("v", "<Leader>as", "<cmd>ClaudeCodeSend<CR>",        opts)
keymap("n", "<Leader>aa", "<cmd>ClaudeCodeDiffAccept<CR>",  opts)
keymap("n", "<Leader>ad", "<cmd>ClaudeCodeDiffDeny<CR>",    opts)

-- Insert
keymap("i", "qq", "<ESC>", opts)

-- Visual indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- NvimTree
keymap("n", "tt", ":NvimTreeToggle<CR>",   opts)
keymap("n", "tf", ":NvimTreeFindFile<CR>", opts)

-- Indent blankline
keymap("n", "<leader>il", ":IndentBlanklineToggle<CR>", opts)

-- Terminal
keymap("n", "<C-\\>", ":ToggleTerm<CR>", opts)

-- Fzf
keymap("n", "<C-f>",      ":FzfLua files<CR>",       opts)
keymap("n", "te",         ":FzfLua<CR>",              opts)
keymap("n", "<leader>f",  ":FzfLua live_grep<CR>",    opts)
keymap("n", "<leader>l",  ":FzfLua lgrep_curbuf<CR>", opts)
keymap("n", "<leader>h",  ":FzfLua oldfiles<CR>",     opts)
keymap("v", "<leader>f",  "<ESC>:FzfLua grep_visual<CR>", opts)
keymap("n", "<leader>F",  ":FzfLua grep<CR>",         opts)

-- Git
keymap("n", "<leader>gg", ":LG<CR>", opts)
keymap("n", ",co", "<Plug>(git-conflict-ours)")
keymap("n", ",ct", "<Plug>(git-conflict-theirs)")
keymap("n", ",cb", "<Plug>(git-conflict-both)")
keymap("n", ",c0", "<Plug>(git-conflict-none)")
keymap("n", "]x",  "<Plug>(git-conflict-prev-conflict)")
keymap("n", "[x",  "<Plug>(git-conflict-next-conflict)")

-- Pounce
keymap("n", "s", "<cmd>Pounce<CR>", opts)
keymap("n", "S", "<cmd>Pounce<CR>", opts)
keymap("v", "s", "<cmd>Pounce<CR>", opts)
