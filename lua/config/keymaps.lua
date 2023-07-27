-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Quick Write and quit
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":qa<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>t", ":tabnew<CR>", opts)

-- Fzf
keymap("n", "<C-f>", ":FzfLua files<CR>", opts)
keymap("n", "te", ":FzfLua<CR>", opts)
keymap("n", "<leader>f", ":FzfLua live_grep<CR>", opts)
-- keymap("n", "<leader>l", ":FzfLua lgrep_curbuf<CR>", opts)
keymap("n", "<leader>h", ":FzfLua oldfiles<CR>", opts)
keymap("v", "<leader>f", "<ESC>:FzfLua grep_visual<CR>", opts)
keymap("n", "<leader>F", ":FzfLua grep<CR>", opts)

-- NeoTree
keymap("n", "tt", ":Neotree toggle<CR>", opts)
keymap("n", "tf", ":NvimTreeFindFile<CR>", opts)
