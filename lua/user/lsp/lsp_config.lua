local handlers = require("user.lsp.handlers")

local base = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
}

local server_configs = {
  lua_ls = vim.tbl_deep_extend("force", require("user.lsp.settings.lua_ls"), base),
  pylsp = vim.tbl_deep_extend("force", require("user.lsp.settings.python"), base),
}

local servers = {
  "lua_ls",
  "cssls",
  "html",
  "ts_ls",
  "pylsp",
  "bashls",
  "jsonls",
  "yamlls",
  "gopls",
  "perlnavigator",
  "vimls",
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, server_configs[server] or base)
end

vim.lsp.enable(servers)
