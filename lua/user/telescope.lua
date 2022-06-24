local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    prompt_prefix = ">",
    selection_caret = ">",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        -- ["<Down>"] = actions.cycle_history_next,
        -- ["<Up>"] = actions.cycle_history_prev,
        -- ["<C-j>"] = actions.move_selection_next,
        -- ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      sorter=fzf_native,
      layout_strategy='flex',
      layout_config={ width = 0.8,
                      flex = { flip_columns = 160},
                      vertical = { preview_height = 0.8},
                      }
    },
    live_grep = {
      sorter=fzf_native,
      layout_strategy='flex',
      layout_config={ width = 0.8,
                      flex = { flip_columns = 160},
                      vertical = { preview_height = 0.8},
                      }
    },
    oldfiles = {
      sorter=fzf_native,
      layout_strategy='flex',
      layout_config={ width = 0.8,
                      flex = { flip_columns = 160},
                      vertical = { preview_height = 0.8},
                      }
   --    only_cwd = true, 
    },
    grep_string = {
      sorter=fzf_native,
      layout_strategy='flex',
      layout_config={ width = 0.8,
                      flex = { flip_columns = 160},
                      vertical = { preview_height = 0.8},
                      }
   --    only_cwd = true, 
    },
    git_bcommits = {
      sorter=fzf_native,
      layout_strategy='flex',
      layout_config={ width = 0.8,
                      flex = { flip_columns = 160},
                      vertical = { preview_height = 0.8},
                      },
      git_command = { "git", "log", "--pretty=oneline", "--abbrev-commit"}
   --    only_cwd = true, 
    },
    git_commits = {
      sorter=fzf_native,
      layout_strategy='flex',
      layout_config={ width = 0.8,
                      flex = { flip_columns = 160},
                      vertical = { preview_height = 0.8},
                      },
      git_command = { "git", "log", "--pretty=oneline", "--abbrev-commit", "--" }
   --    only_cwd = true, 
    },
    current_buffer_fuzzy_find = {
      sorter=fzf_native,
      layout_strategy='flex',
      layout_config={ width = 0.8,
                      flex = { flip_columns = 160},
                      vertical = { preview_height = 0.8},
                      }
   --    only_cwd = true, 
    }
  },
  extensions = {
    fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                          -- the default case_mode is "smart_case"
          },
   -- fzy_native = {
   --     override_generic_sorter = true,
   --     override_file_sorter = true,
   -- }
  }
}
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('harpoon')
-- require("telescope").load_extension("git_worktree")
