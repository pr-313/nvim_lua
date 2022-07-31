local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

--some netrw nice to haves
vim.g.netrw_liststyle = 3

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  auto_reload_on_write = false,
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = false,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = true,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = true,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  git = {
    enable=false,
    ignore=false
  },
  actions = {
    change_dir = {
      enable=true,
      global=true,
    },
    open_file = {
      resize_window=false,
    }
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    height = 30,
    side = "left",
    -- hide_root_folder=true,
    mappings = {
      custom_only=true,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = "<C-e>",                          action = "edit_in_place" },
        { key = "O",                              action = "edit_no_picker" },
        { key = { "C", "<2-RightMouse>" },        action = "cd" },
        { key = "V",                              action = "vsplit" },
        { key = "<C-x>",                          action = "split" },
        { key = "<C-t>",                          action = "tabnew" },
        { key = "<",                              action = "prev_sibling" },
        { key = ">",                              action = "next_sibling" },
        { key = "P",                              action = "parent_node" },
        { key = "<BS>",                           action = "close_node" },
        { key = "<Tab>",                          action = "preview" },
        { key = "K",                              action = "first_sibling" },
        { key = "J",                              action = "last_sibling" },
        { key = "I",                              action = "toggle_git_ignored" },
        { key = "H",                              action = "toggle_dotfiles" },
        -- { key = "U",                              action = "toggle_custom" },
        { key = "R",                              action = "refresh" },
        { key = "a",                              action = "create" },
        { key = "d",                              action = "remove" },
        { key = "D",                              action = "trash" },
        { key = "r",                              action = "rename" },
        { key = "<C-r>",                          action = "full_rename" },
        { key = "x",                              action = "cut" },
        { key = "c",                              action = "copy" },
        { key = "p",                              action = "paste" },
        { key = "y",                              action = "copy_name" },
        { key = "Y",                              action = "copy_path" },
        { key = "gy",                             action = "copy_absolute_path" },
        { key = "[c",                             action = "prev_git_item" },
        { key = "]c",                             action = "next_git_item" },
        { key = "u",                              action = "dir_up" },
        -- { key = "s",                              action = "system_open" },
        { key = "f",                              action = "live_filter" },
        { key = "F",                              action = "clear_live_filter" },
        { key = "q",                              action = "close" },
        { key = "X",                              action = "collapse_all" },
        { key = "E",                              action = "expand_all" },
        { key = "S",                              action = "search_node" },
        { key = ".",                              action = "run_file_command" },
        { key = "<C-k>",                          action = "toggle_file_info" },
        { key = "g?",                             action = "toggle_help" },
      },
    },
  },
}
