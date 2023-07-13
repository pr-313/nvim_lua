local status, mason_null_ls = pcall(require, "null-ls")
if not status then
    return
end

mason_null_ls.setup({
    -- A list of sources to install if they're not already installed.
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = {},
    -- Run `require("null-ls").setup`.
    -- Will automatically install masons tools based on selected sources in `null-ls`.
    -- Can also be an exclusion list.
    -- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
    automatic_installation = false,
    -- See [#handlers-usage](#handlers-usage) section
    handlers = nil,
})
