-- EXAMPLE 
local configs = require("nvchad.configs.lspconfig")
-- local on_attach = function (client, bufnum)
-- function on_attach(client, bufnum)
--   print("Lsp attaching")
--   vim.keymap.set({'n', 'v'}, "K", vim.lsp.buf.hover, {
--     desc = "Lsp Hover",
--     -- buffer = bufnum,
--   })
--   configs.on_attach(client, bufnum)
-- end
local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  cssls = { filetypes = { 'html', 'css', 'scss', 'less' } },
  html = { filetypes = { 'html', 'templ', 'typescriptreact' } },
  htmx = { filetypes = { 'html', 'templ', 'typescriptreact' } },
  jsonls = {},
  tsserver = {},
  tailwindcss = {},
  denols = { root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")}, -- deno.json
  biome = {}, -- biome.json
  quick_lint_js = {},
  bashls = {},
  -- pyright = {},
  clangd = { single_file_support = true },
  -- ccls = { single_file_support = true },
  zls = {},
  ruff_lsp = {},
  pylsp = {},
  pylyzer = { single_file_support = false, root_dir = lspconfig.util.root_pattern("pylyzer") },
  -- java_language_server = { single_file_support = true, cmd = { '/home/kevin/Documents/java-language-server/dist/lang_server_linux.sh' } },
}

for lsp, opts in pairs(servers) do
  opts.on_attach = on_attach
  opts.on_init = on_init
  opts.capabilities = capabilities
  lspconfig[lsp].setup(opts)
end

vim.lsp.handlers["textDocument/hover"] =
vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] =
vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
