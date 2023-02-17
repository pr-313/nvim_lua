local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_c = { { "filename", path = 1 }, components.diff }
