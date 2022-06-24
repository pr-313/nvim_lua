-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

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
keymap("n", "<M-Up>", ":resize -2<CR>", opts)
keymap("n", "<M-Down>", ":resize +2<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)

-- Quick Write and quit
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>t", ":tabnew<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<leader>d", "V\"_d", opts)
keymap("v", "<leader>d", "\"_d", opts)

-- Folding
keymap("n", "<Space>", "za", opts)
keymap("v", "<Space>", "zf", opts)

-- Moving Lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

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
keymap("n", "tu", ":UndotreeToggle", opts)

-- Term Copy paste
keymap("n", "<leader>y", "\"+y", opts)
keymap("n", "Y", "y$", opts)
keymap("n", "<leader>p", "\"+p", opts)
keymap("v", "<leader>r", "y:%s@<C-r>\"@")

-- Clear highlights
keymap("n", "<M-s>", "<cmd>nohlsearch<CR>", opts)

-- Quick Sets
keymap("n", "<leader>W", ":set wrap! wrap?<CR>", opts)
keymap("n", "<leader>H", ":set hlsearch! hlsearch?<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

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
keymap("n", "tf", ":NvimTreeFindFileToggle<CR>", opts)

-- Telescope
keymap("n", "<C-f>", ":Telescope find_files<CR>", opts)
keymap("n", "te", ":Telescope<CR>", opts)
keymap("n", "<leader>f", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>h", ":Telescope oldfiles<CR>", opts)
keymap("v", "<leader>f", "y:lua require('telescope.builtin').grep_string({search = vim.fn.getreg('\"')})<CR>", opts)
keymap("n", "<leader>F", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>")
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>cc", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>cc", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

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

-- Custom Keymaps Call
  vim.cmd("source ~/my_nvim/*")
