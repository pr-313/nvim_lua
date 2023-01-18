local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }
vim.cmd("source ~/.config/lvim/lua/user/some_vim_funcs.vim")

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<M-H>", "20zh", opts)
keymap("n", "<M-L>", "20zl", opts)

-- Resize with arrows
keymap("n", "<M-k>", ":call TmuxResize('k', 4)<CR>", opts)
keymap("n", "<M-j>", ":call TmuxResize('j', 4)<CR>", opts)
keymap("n", "<M-h>", ":call TmuxResize('h', 4)<CR>", opts)
keymap("n", "<M-l>", ":call TmuxResize('l', 4)<CR>", opts)

-- Quick Write and quit
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":qa<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>t", ":tabnew<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":tabnext<CR>", opts)
keymap("n", "<S-h>", ":tabprevious<CR>", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<leader>d", "V\"_d", opts)
keymap("v", "<leader>d", "\"_d", opts)
keymap("n", "<C-p>", ":call ToggleNetrw()<CR>", opts)

-- Window Maximizer
keymap("n", "<leader><leader>", ":MaximizerToggle<CR>", opts)

-- Folding
keymap("n", "<Space>", "za", opts)
keymap("v", "<Space>", "zf", opts)

-- Moving Lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Quickfix navigation
keymap("n", "<M-m>", ":copen<CR>", opts)
keymap("n", "<M-b>", ":cprevious<CR>", opts)
keymap("n", "<M-n>", ":cnext<CR>", opts)

-- Quick Find
keymap("v", "<leader>g", "y/<C-r>\"<cr>")

-- Undo Breaks
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)
keymap("i", ";", ";<c-g>u", opts)
keymap("i", "<CR>", "<CR><c-g>u", opts)
keymap("i", "<space>", "<space><c-g>u", opts)
keymap("n", "tu", ":UndotreeToggle<CR>", opts)

-- Term Copy paste
keymap("n", "<leader>y", "\"+y", opts)
keymap("n", "Y", "y$", opts)
keymap("n", "<leader>p", "\"+p", opts)
keymap("v", "<leader>r", "y:%s@<C-r>\"@")
keymap("v", "<leader>y", "\"+y", opts)

-- Clear highlights
keymap("n", "<M-s>", "<cmd>nohlsearch<CR>", opts)

-- Quick Sets
keymap("n", "<leader>W", ":set wrap! wrap?<CR>", opts)
keymap("n", "<leader>H", ":set hlsearch! hlsearch?<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- NvimTree
keymap("n", "tt", ":NvimTreeToggle<CR>", opts)
keymap("n", "tf", ":NvimTreeFindFile<CR>", opts)

-- Telescope
keymap("n", "<C-f>", ":Telescope git_files<CR>", opts)

