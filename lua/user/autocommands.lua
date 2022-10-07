-- Use 'q' to quit from common plugins
local id = vim.api.nvim_create_augroup("MyGroup", {
    clear = true
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
  group="MyGroup"
})

-- -- Remove statusline and tabline when in Alpha
-- vim.api.nvim_create_autocmd({ "User" }, {
--   pattern = { "AlphaReady" },
--   callback = function()
--     vim.cmd [[
--       set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
--       set laststatus=0 | autocmd BufUnload <buffer> set laststatus=2
--     ]]
--   end,
--   group="MyGroup"
-- })

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  group="MyGroup"
})

-- vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
  group="MyGroup"
})

-- -- Highlight Yanked Text
-- vim.api.nvim_create_autocmd({ "TextYankPost" }, {
--   callback = function()
--     vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
--   end,
--   group="MyGroup"
-- })


vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {"git"},
  callback = function()
    vim.cmd [[
      set foldmethod=syntax 
    ]]
  end,
  group="MyGroup"
})


vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = {"*.inc","*.v","*.sv","*.svh"},
  callback = function()
    vim.cmd [[
      setlocal filetype=verilog_systemverilog
    ]]
  end,
  group="MyGroup"
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = {"*"},
  callback = function()
        if vim.fn.getfsize(vim.fn.expand("%:p")) > 1000000 then
            vim.opt_local.filetype="text"
            require("cmp").setup.buffer {enabled=false}
            require("cmp").setup.cmdline ( '/' , {enabled=false} )
            vim.cmd [[
                :LspStop
            ]]
        end
  end,
  group="MyGroup"
})


vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = {"*.log"},
  callback = function()
    vim.cmd [[
      setlocal filetype=text
    ]]
  end,
})
