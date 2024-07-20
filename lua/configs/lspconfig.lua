local map = vim.keymap.set

local on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  -- Jumping to stuff
  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "gr", vim.lsp.buf.references, opts "Show references")
  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
  map('n', '<leader>lq', vim.lsp.buf.code_action, opts "Quick Fix" )
  -- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")

  -- LSP info
  map({'n', 'v'}, 'K', vim.lsp.buf.hover, { noremap = true, desc = "Lsp Info" })
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")

  -- Workspace folders (what does lsp scan)
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  -- Smart lsp renamer
  map("n", "<leader>ra", function()
    require "nvchad.lsp.renamer"()
  end, opts "NvRenamer")

end

-- disable semanticTokens
local on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

-- Enable various completion support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local lspconfig = require "lspconfig"
local root_pattern = lspconfig.util.root_pattern
local servers = {

  --- Web dev
  cssls = { filetypes = { 'html', 'css', 'scss', 'less' } },
  html = { filetypes = { 'html', 'templ', 'typescriptreact' } },
  htmx = { filetypes = { 'html', 'templ', 'typescriptreact' } },
  jsonls = {},
  tsserver = {},
  tailwindcss = {},
  denols = { root_dir = root_pattern("deno.json", "deno.jsonc")}, -- deno.json
  biome = {}, -- biome.json
  quick_lint_js = {},

  --- Scripting
  lua_ls = { settings = { Lua = {
    diagnostics = { globals = { "vim" } },
    workspace = {
      library = {
        vim.fn.expand "$VIMRUNTIME/lua",
        vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
        vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
        vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
      },
      maxPreload = 100000,
      preloadFileSize = 10000,
    }
  } } },
  bashls = {},
  -- pyright = {},
  ruff_lsp = {},
  pylsp = {},
  pylyzer = { single_file_support = false, root_dir = root_pattern("pylyzer") },

  -- Java?
  -- java_language_server = { single_file_support = true, cmd = { '/home/kevin/Documents/java-language-server/dist/lang_server_linux.sh' } },
  --
  -- Low Level
  clangd = { single_file_support = true },
  -- ccls = { single_file_support = true },
  zls = {},
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

-- EXAMPLE 
-- local on_attach = function (client, bufnum)
-- function on_attach(client, bufnum)
--   print("Lsp attaching")
--   vim.keymap.set({'n', 'v'}, "K", vim.lsp.buf.hover, {
--     desc = "Lsp Hover",
--     -- buffer = bufnum,
--   })
--   configs.on_attach(client, bufnum)
-- end
