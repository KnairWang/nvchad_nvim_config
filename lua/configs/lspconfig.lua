-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local map = vim.keymap.set

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local function on_attach(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  nvlsp.on_attach(client, bufnr)

  map("n", "gy", vim.lsp.buf.type_definition, opts "Go to type definition")
end

local function on_init(client, bufnr)
  nvlsp.on_init(client, bufnr)
end

local function make_capabilities()
  return nvlsp.capabilities
end

local capabilities = make_capabilities()

-- Servers with default config
local servers = {
  "basedpyright",
  "csharp_ls",
  "cssls",
  "elixirls",
  "html",
  "gleam",
  "jsonls",
  "pyright",
  "taplo",
  "ts_ls",
  "yamlls",
}

-- setup lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      }
    }
  }
}
