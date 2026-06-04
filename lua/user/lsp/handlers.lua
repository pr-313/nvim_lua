local M = {}

M.setup = function()
  local signs = {

    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = true, -- disable virtual text
    signs = {
      active = signs, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local k = vim.keymap.set
  k("n", "gD",          vim.lsp.buf.declaration,                        opts)
  k("n", "gd",          vim.lsp.buf.definition,                         opts)
  k("n", "K",           vim.lsp.buf.hover,                              opts)
  k("n", "gI",          vim.lsp.buf.implementation,                     opts)
  k("n", "gr",          vim.lsp.buf.references,                         opts)
  k("n", "gl",          vim.diagnostic.open_float,                      opts)
  k("n", "<leader>lf",  function() require("conform").format({ async = true, lsp_fallback = true }) end, opts)
  k("n", "<leader>li",  "<cmd>LspInfo<cr>",                             opts)
  k("n", "<leader>la",  vim.lsp.buf.code_action,                        opts)
  k("n", "<leader>lj",  vim.diagnostic.goto_next,                       opts)
  k("n", "<leader>lk",  vim.diagnostic.goto_prev,                       opts)
  k("n", "<leader>lr",  vim.lsp.buf.rename,                             opts)
  k("n", "<leader>ls",  vim.lsp.buf.signature_help,                     opts)
  k("n", "<leader>lq",  vim.diagnostic.setloclist,                      opts)
end

local cmp_nvim_lsp = require("cmp_nvim_lsp")
M.capabilities = cmp_nvim_lsp.default_capabilities(
  vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), {
    textDocument = { completion = { completionItem = { snippetSupport = true } } },
  })
)

M.on_attach = function(client, bufnr)
  if client.name == "ts_ls" or client.name == "lua_ls" then
    client.server_capabilities.document_formatting = false
  end

  lsp_keymaps(bufnr)
  local status_ok, illuminate = pcall(require, "illuminate")
  if status_ok then
    illuminate.on_attach(client)
  end
end

return M
