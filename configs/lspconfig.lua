local configs  = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  cssls = {},
  html = { filetypes = { 'html', 'templ', 'typescriptreact'} },
  htmx = { filetypes = { 'html', 'templ', 'typescriptreact'} },
  jsonls = {},
  tsserver = {},
  tailwindcss = {},
  denols = { root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")}, -- deno.json
  biome = {}, -- biome.json
  quick_lint_js = {},
  bashls = {},
  pyright = {},
  clangd = {},
  zls = {},
  ruff_lsp = {},
  pylsp = {},
  pylyzer = { single_file_support = false, root_dir = lspconfig.util.root_pattern("pylyzer") },
}

for lsp, opts in pairs(servers) do
  opts.on_attach = on_attach
  opts.capabilities = capabilities
  lspconfig[lsp].setup(opts)
end

-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end
--
-- lspconfig["biome"].setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = lspconfig.util.root_pattern("package.json")
-- }
--
-- lspconfig["quick_lint_js"].setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = lspconfig.util.root_pattern("package.json", "deno.json")
-- }
--
-- lspconfig["htmx"].setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = lspconfig.util.root_pattern("index.tsx", "index.html"),
--   filetypes = { "html", "htmx", "templ", "typescriptreact" }
-- }
--
-- lspconfig["denols"].setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = lspconfig.util.root_pattern("deno.json")
-- }
--
-- lspconfig["tailwindcss"].setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = lspconfig.util.root_pattern("tailwind.config.js")
-- }
