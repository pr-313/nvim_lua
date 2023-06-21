local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local servers = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
  "pylsp",
  "bashls",
  "jsonls",
  "yamlls",
  "gopls",
  "verible",
  "vimls"
}

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server == "lua_ls" then
    local lua_ls_opts = require "user.lsp.settings.lua_ls"
    opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
  end

  if server == "pylsp" then
    local pylsp_opts = require "user.lsp.settings.python"
    opts = vim.tbl_deep_extend("force", pylsp_opts, opts)
  end

  if server == "verible" then
    local verible_opts = require "user.lsp.settings.verible"
    opts = vim.tbl_deep_extend("force", verible_opts, opts)
  end

  lspconfig[server].setup(opts)
end



