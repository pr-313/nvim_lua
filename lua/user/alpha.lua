local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[                                                     ]],
  [[      /\_____/\                                      ]],
  [[     /  o   o  \      meow.                         ]],
  [[    ( ==  ^  == )                                    ]],
  [[     )         (      nvim v]] .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch .. [[     ]],
  [[    (           )                                    ]],
  [[   ( (  )   (  ) )                                   ]],
  [[  (__(__)___(__)__)                                  ]],
  [[                                                     ]],
}

dashboard.section.buttons.val = {
  dashboard.button("<C-f>", "  Find file",    ":FzfLua files<CR>"),
  dashboard.button("r",     "  Recent files", ":FzfLua oldfiles<CR>"),
  dashboard.button("f",     "  Live grep",    ":FzfLua live_grep<CR>"),
  dashboard.button("e",     "  New file",     ":ene <BAR> startinsert<CR>"),
  dashboard.button("c",     "  Config",       ":e ~/.config/nvim/<CR>"),
  dashboard.button("q",     "  Quit",         ":qa<CR>"),
}

dashboard.section.footer.val = "  @pbharati"
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
