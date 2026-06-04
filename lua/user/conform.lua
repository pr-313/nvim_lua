require("conform").setup({
    formatters_by_ft = {
        lua        = { "stylua" },
        sh         = { "shfmt" },
        bash       = { "shfmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json       = { "prettier" },
        html       = { "prettier" },
        css        = { "prettier" },
        markdown   = { "prettier" },
        yaml       = { "prettier" },
        python     = { "black", stop_after_first = true },
    },
    format_on_save = false,
})
