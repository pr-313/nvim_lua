vim.g.mapleader = ","
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
keymap("n", "<leader>Q", ":qa<CR>", opts)
lvim.builtin.which_key.mappings["t"] = { ":tabnew<cr>", "Tab New" }
lvim.builtin.which_key.mappings["Q"] = { ":qa<cr>", "Quit All" }

-- Navigate buffers
keymap("n", "<S-l>", ":tabnext<CR>", opts)
keymap("n", "<S-h>", ":tabprevious<CR>", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<C-p>", ":call ToggleNetrw()<CR>", opts)
lvim.builtin.which_key.mappings["d"] = { "V\"_d", "Delete to null reg" }
lvim.builtin.which_key.vmappings["d"] = { "\"_d", "Delete to null reg" }

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
lvim.builtin.which_key.vmappings["g"] = { "y/<C-r>\"<cr>", "Quick Lookup" }

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
keymap("n", "Y", "y$", opts)
lvim.builtin.which_key.mappings["P"] = { "\"+p", "Paste from system clipboard" }
lvim.builtin.which_key.vmappings["r"] = { "y:%s@<C-r>\"@", "Start replace menu" }
lvim.builtin.which_key.vmappings["y"] = { "\"+y", "Yank to system clipboard" }


-- Clear highlights
keymap("n", "<M-s>", "<cmd>nohlsearch<CR>", opts)

-- Quick Sets
lvim.builtin.which_key.mappings["W"] = { ":set wrap! wrap?<CR>", "Toggle Wrap" }
lvim.builtin.which_key.mappings["/"] = {}
lvim.builtin.which_key.mappings["c"] = {
  name = "Comment",
  c = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
  b = { "<Plug>(comment_toggle_blockwise_current)", "Comment toggle block" }
}

lvim.builtin.which_key.vmappings["c"] = {
  name = "Comment",
  c = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
  b = { "<Plug>(comment_toggle_blockwise_current)", "Comment toggle block" }
}

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- NvimTree
keymap("n", "tt", ":NvimTreeToggle<CR>", opts)
keymap("n", "tf", ":NvimTreeFindFile<CR>", opts)

-- Telescope
keymap("n", "<C-f>",
  function()
    require("lvim.core.telescope.custom-finders").find_project_files { previewer = false }
  end, opts)
-- lvim.builtin.which_key.mappings.L.k[1] = "<cmd>FzfLua keymaps<cr>"
-- lvim.builtin.which_key.mappings.g.C[1] = "<cmd>FzfLua git_bcommits<cr>"
-- lvim.builtin.which_key.mappings.g.b[1] = "<cmd>FzfLua git_branches<cr>"
-- lvim.builtin.which_key.mappings.g.c[1] = "<cmd>FzfLua git_commits<cr>"
-- lvim.builtin.which_key.mappings.g.o[1] = "<cmd>FzfLua git_status<cr>"
-- lvim.builtin.which_key.mappings.l.S[1] = "<cmd>FzfLua lsp_live_workspace_symbols<cr>"
-- lvim.builtin.which_key.mappings.l.e[1] = "<cmd>FzfLua quickfix<cr>"
-- lvim.builtin.which_key.mappings.l.s[1] = "<cmd>FzfLua lsp_document_symbols<cr>"
-- lvim.builtin.which_key.mappings.l.w[1] = "<cmd>FzfLua diagnostics_document<cr>"
-- lvim.builtin.which_key.mappings.s.C[1] = "<cmd>FzfLua commands<cr>"
-- lvim.builtin.which_key.mappings.s.H[1] = "<cmd>FzfLua highlights<cr>"
-- lvim.builtin.which_key.mappings.s.M[1] = "<cmd>FzfLua man_pages<cr>"
-- lvim.builtin.which_key.mappings.s.R[1] = "<cmd>FzfLua registers<cr>"
-- lvim.builtin.which_key.mappings.s.b[1] = "<cmd>FzfLua git_branches<cr>"
-- lvim.builtin.which_key.mappings.s.c[1] = "<cmd>FzfLua colorschemes<cr>"
-- lvim.builtin.which_key.mappings.s.f[1] = "<cmd>FzfLua files<cr>"
-- lvim.builtin.which_key.mappings.s.h[1] = "<cmd>FzfLua help_tags<cr>"
-- lvim.builtin.which_key.mappings.s.k[1] = "<cmd>FzfLua keymaps<cr>"
-- lvim.builtin.which_key.mappings.s.p[1] = ""
-- lvim.builtin.which_key.mappings.s.r[1] = "<cmd>FzfLua oldfiles<cr>"
-- lvim.builtin.which_key.mappings.s.t[1] = "<cmd>FzfLua live_grep<cr>"
-- -- Fzf
-- keymap("n", "<C-f>", ":lua require('fzf-lua').files({ fzf_opts = {['--no-preview'] = ''}, winopts = {preview = {vertical = 'up:0%'}} })<CR>", opts)
-- keymap("n", "te", ":FzfLua<CR>", opts)
-- lvim.builtin.which_key.mappings["f"] = { ":FzfLua live_grep<CR>", "Live Grep" }
-- lvim.builtin.which_key.mappings["sl"] = { ":FzfLua lgrep_curbuf<CR>", "Current Buffer" }
-- lvim.builtin.which_key.mappings["F"] = { ":FzfLua grep<CR>", "Fuzzy Grep with Seed Word" }
-- lvim.builtin.which_key.vmappings["f"] = { "<ESC>:FzfLua grep_visual<CR>", "Fuzzy Grep with Seed Word" }
