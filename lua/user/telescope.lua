-- -- Use which-key to add extra bindings with the leader-key prefix
function Get_search_seed_from_prompt()
  require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") });
end

lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" }
lvim.builtin.which_key.mappings["sl"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" }
lvim.builtin.which_key.mappings["F"] = { ":lua Get_search_seed_from_prompt()<CR>", "Fuzzy Grep with Seed Word" }
function Find_selection()
  require('telescope.builtin').grep_string({ search = vim.fn.getreg('"') });
end

lvim.builtin.which_key.vmappings["f"] = { "y:lua Find_selection()<cr>", "Fuzzy Grep with Seed Word" }
