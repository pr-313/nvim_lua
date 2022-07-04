local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
[[                                                                                         @@@@@@@@@@@@@@@@@@@@    ]],
[[                                                                                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@, ]],
[[                                                                            @@@@@@                   @@@@@@@@@@@.]],
[[                                                                       @@@@                            @@@@@@@@@@]],
[[                                                                  .@@                                   @@@@@@@@@]],
[[                                                                                                        @@@@@@@@ ]],
[[                                                          @@                                            @@@@@@@  ]],
[[                                                     #@@.                                              @@@@@@@   ]],
[[                                                 ,@@@                                                 @@@@@@@    ]],
[[                                              @@@,                                                   @@@@@@@     ]],
[[                                @@@@@@@@@@@@@@@                          @@@@@@@@@@@@@@@@           @@@@@@       ]],
[[                             @@@@@@@@@@@@@@@@@@@@@                     @@@@@@@@@@@@@@@@@@@@       @@@@@@,        ]],
[[                           ,@@@@@@@@@@@@@@@@@@@@@@@                  @@@@@@@@@@@@@@@@@@@@@@@@    @@@@@@          ]],
[[                           @@@@@@@@@@@@@@@@@@@@@@@@@@               @@@@@@@@@@@@@@@@@@@@@@@@/  @@@@@@            ]],
[[                          @@@@@@@@@@@@@@@@@@@@@@@@@@@@             @@@@@@@@@@@@@@@@@@@@@@@@  @@@@@#              ]],
[[                          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@          /@@@@@@@@@@@@@@@@@@@@@@@  @@@@@                 ]],
[[                        @@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@        @@@@@@@@@@@@@@@@@@@@@@/  @@@@@                   ]],
[[                     @@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@@@      @@@@@@@@@@@@@@@@ @@@@   @@@@@@@                   ]],
[[                  *@@@@@  @@@@@@@@@@@@@@   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&  @@  %@@@@@@@@@                   ]],
[[                @@@@@@    @@@@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      @@@@@@@@@@@@                   ]],
[[              @@@@@       @@@@@@@@@@@@@@      @@@@@@@@@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@                   ]],
[[            @@@@@         @@@@@@@@@@@@@@         @@@@@@@@@@@@@@@@@@@@@@@    /@@@@@@@@@@@@@@@@@                   ]],
[[          @@@@@           @@@@@@@@@@@@@@             @@@@@@@@@@@@@@@     .@@@   @@@@@@@@@@@@@@                   ]],
[[        @@@@@*            @@@@@@@@@@@@@@                              @@@       @@@@@@@@@@@@@@                   ]],
[[      @@@@@@              @@@@@@@@@@@@@@                           @@@          @@@@@@@@@@@@@@                   ]],
[[     @@@@@,               @@@@@@@@@@@@@@                       #@@              @@@@@@@@@@@@@@                   ]],
[[   @@@@@@                 @@@@@@@@@@@@@@         &@@        @@/                 @@@@@@@@@@@@@@                   ]],
[[  @@@@@@@                 @@@@@@@@@@@@@@     @@@        @@&                                                      ]],
[[ @@@@@@@                  @@@@@@@@@@@    @@@&                                                                    ]],
[[@@@@@@@@                  @@@@@@    @@@@                                                                         ]],
[[@@@@@@@@@@                     @@@@@@@@@                                                                         ]],
[[@@@@@@@@@@@@@          ,@@@@@@@@@@@@@@@@                                                                         ]],
[[ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                         ]],
[[    @@@@@@@@@@@@@@@       @@@@@@@@@@@@@@                                                                         ]],
[[                          @@@@@@@@@@@@@@                                                                         ]],
}
dashboard.section.buttons.val = {
  dashboard.button("<C-f>", " " .. " Find file", ":FzfLua files <CR>"),
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  -- dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  dashboard.button("r", " " .. " Recent files", ":FzfLua oldfiles <CR>"),
  dashboard.button("tt", " " .. " File Tree", ":NvimTreeToggle<CR>"),
  dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/ <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
local function footer()
  return "Maintained by @pbharati"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
