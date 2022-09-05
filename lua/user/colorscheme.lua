
vim.g.tokyonight_style = "night"
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.g.gruvbox_contrast_dark = "hard"
local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
