-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i"
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

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

-- Verilog
keymap("n", "<M-V>", ":set filetype=verilog_systemverilog<CR>", opts)

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

--Harpoon
keymap("n", "<Leader>a", ":lua require(\"harpoon.mark\").add_file()<cr>:echom \"File added to Harpoon\"<CR>", opts)
keymap("n", "<Leader>m", ":lua require(\"harpoon.ui\").toggle_quick_menu()<cr>", opts)
keymap("n", "<Leader>1", ":lua require(\"harpoon.ui\").nav_file(1)<cr>:echom \"File in Harpoon 1\"<CR>", opts)
keymap("n", "<Leader>2", ":lua require(\"harpoon.ui\").nav_file(2)<cr>:echom \"File in Harpoon 1\"<CR>", opts)
keymap("n", "<Leader>3", ":lua require(\"harpoon.ui\").nav_file(3)<cr>:echom \"File in Harpoon 1\"<CR>", opts)
keymap("n", "<Leader>4", ":lua require(\"harpoon.ui\").nav_file(4)<cr>:echom \"File in Harpoon 1\"<CR>", opts)
keymap("n", "<Leader>5", ":lua require(\"harpoon.ui\").nav_file(5)<cr>:echom \"File in Harpoon 1\"<CR>", opts)
keymap("n", "<Leader>6", ":lua require(\"harpoon.ui\").nav_file(6)<cr>:echom \"File in Harpoon 1\"<CR>", opts)
keymap("n", "<Leader>7", ":lua require(\"harpoon.ui\").nav_file(7)<cr>:echom \"File in Harpoon 1\"<CR>", opts)
keymap("n", "<Leader>8", ":lua require(\"harpoon.ui\").nav_file(8)<cr>:echom \"File in Harpoon 1\"<CR>", opts)
keymap("n", "<Leader>9", ":lua require(\"harpoon.ui\").nav_file(9)<cr>:echom \"File in Harpoon 1\"<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "qq", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "tt", ":NvimTreeToggle<CR>", opts)
keymap("n", "tf", ":NvimTreeFindFile<CR>", opts)

-- Indent Blankline
keymap("n", "<leader>il", ":IndentBlanklineToggle<CR>", opts)

-- ToggleTerm
keymap("n", "<C-\\>", ":ToggleTerm<CR>", opts)

-- Telescope
-- keymap("n", "<C-f>", ":Telescope find_files<CR>", opts)
-- keymap("n", "te", ":Telescope<CR>", opts)
-- keymap("n", "<leader>f", ":Telescope live_grep<CR>", opts)
-- keymap("n", "<leader>h", ":Telescope oldfiles<CR>", opts)
-- keymap("v", "<leader>f", "y:lua require('telescope.builtin').grep_string({search = vim.fn.getreg('\"')})<CR>", opts)
-- keymap("n", "<leader>F", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>")
-- keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
-- keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Fzf
keymap("n", "<C-f>", ":FzfLua files<CR>", opts)
keymap("n", "te", ":FzfLua<CR>", opts)
keymap("n", "<leader>f", ":FzfLua live_grep<CR>", opts)
keymap("n", "<leader>l", ":FzfLua lgrep_curbuf<CR>", opts)
keymap("n", "<leader>h", ":FzfLua oldfiles<CR>", opts)
keymap("v", "<leader>f", "<ESC>:FzfLua grep_visual<CR>", opts)
keymap("n", "<leader>F", ":FzfLua grep<CR>", opts)
-- keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
-- keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Tagbar
keymap("n", "tg", ":TagbarToggle<CR>", opts)

-- Sidebar
keymap("n", "ts", ":SidebarNvimToggle<CR>", opts)

-- Git
keymap("n", "<leader>gg", ":Lazygit<CR>", opts)
keymap('n', ',co', '<Plug>(git-conflict-ours)')
keymap('n', ',ct', '<Plug>(git-conflict-theirs)')
keymap('n', ',cb', '<Plug>(git-conflict-both)')
keymap('n', ',c0', '<Plug>(git-conflict-none)')
keymap('n', ']x', '<Plug>(git-conflict-prev-conflict)')
keymap('n', '[x', '<Plug>(git-conflict-next-conflict)')

-- Comment
-- keymap("x", "<leader>cc", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- Pounce

keymap("n", "s", "<cmd>Pounce<CR>", opts)
keymap("n", "S", "<cmd>Pounce<CR>", opts)
keymap("v", "s", "<cmd>Pounce<CR>", opts)

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

