local status, mason_null_ls = pcall(require, "mason-null-ls")
if not status then
    return
end

local null_ls = require 'null-ls'
null_ls.setup()

mason_null_ls.setup({
    ensure_installed = { 'stylua', 'shfmt', 'prettier' },
    handlers = {
        function() end, -- disables automatic setup of all null-ls sources
        stylua = function(source_name, methods)
            null_ls.register(null_ls.builtins.formatting.stylua)
        end,
        shfmt = function(source_name, methods)
            -- custom logic
            require('mason-null-ls').default_setup(source_name, methods) -- to maintain default behavior
        end,
    },
})
