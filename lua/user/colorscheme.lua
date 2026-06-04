local ok, kanagawa = pcall(require, "kanagawa")
if ok then
    kanagawa.setup({
        undercurl        = true,
        commentStyle     = { italic = true },
        keywordStyle     = { italic = true },
        statementStyle   = { bold = true },
        transparent      = false,
        dimInactive      = false,
        terminalColors   = true,
    })
end

vim.cmd("colorscheme gruvbox")
