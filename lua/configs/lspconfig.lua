-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "lua_ls",
  "ts_ls",
  "tailwindcss",
  "astro",
  "rust_analyzer",
  "svelte",
  "clangd",
  "eslint",
  "emmet-language-server",
}

vim.lsp.config("*", {
  root_markers = { ".git" },
})

vim.lsp.config("emmet-language-server", {
  cmd = { "emmet-language-server", "--stdio" },
  fileTypes = {
    "css",
    "eruby",
    "html",
    "htmldjango",
    "javascriptreact",
    "less",
    "pug",
    "sass",
    "scss",
    "typescriptreact",
    "htmlangular",
    "svelte",
  },
})

vim.lsp.enable(servers)
-- local nvlsp = require "nvchad.configs.lspconfig"
--
-- -- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,

--   capabilities = nvlsp.capabilities,
-- }
