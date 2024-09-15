-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "tsserver", "gopls", "eslint" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  capabilities = capabilities,
}

-- configuring single server, example: typescript
lspconfig.tsserver.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  -- Example: Vue settings
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vue-support
  -- init_options = {
  --   plugins = {
  --     {
  --       name = "@vue/typescript-plugin",
  --       location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
  --       languages = {"javascript", "typescript", "vue"},
  --     },
  --   },
  -- },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "tsx",
  },
  cmd = { "typescript-language-server", "--stdio" },
}

-- Configure gopls specifically
lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
        unreachable = true,
      },
      usePlaceholders = true,
      codelenses = {
        generate = true,
        gc_details = true,
      },
      -- Formatting options are set globally for the language server, not individually.
      -- Use the Go tools (e.g., gofmt) to handle formatting.
    },
  },
}

-- Configure rust_analyzer
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

lspconfig.eslint.setup({
  settings = {},
  --- file save -> EslintFixAll
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end
  end,
})
