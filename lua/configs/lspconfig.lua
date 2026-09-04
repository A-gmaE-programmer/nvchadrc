
-- 1. Setup Global Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend(
  "force",
  capabilities,
  require("cmp_nvim_lsp").default_capabilities()
)
table.insert(capabilities.textDocument.completion.completionItem.resolveSupport, "detail")
vim.tbl_deep_extend(
  "force",
  capabilities,
  { general = { markdown = { allowedTags = { "<u>", "<b>" } } } }
)

-- 2. Apply Global Defaults
vim.lsp.config("*", {
  capabilities = capabilities,
  -- on_init = function (client, _)
  --   -- Disable semantic tokens if desired
  --   if client.supports_method("textDocument/semanticTokens") then
  --     client.server_capabilities.semanticTokensProvider = nil
  --   end
  -- end
})

-- 3. Language specific configurations
local servers = {

  --- Web dev
  cssls = { filetypes = { 'html', 'css', 'scss', 'less' } },
  html = { filetypes = { 'html', 'templ', 'typescriptreact' } },
  htmx = { filetypes = { 'html', 'templ', 'typescriptreact' } },
  jsonls = {},
  ts_ls = {},
  tailwindcss = {},
  denols = { root_markers = { "deno.json", "deno.jsonc" } }, -- deno.json
  biome = {}, -- biome.json
  -- quick_lint_js = {},

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
  pyright = {},
  -- ruff_lsp = {},
  -- pylsp = {},
  pylyzer = { single_file_support = false, root_markers = { "pylyzer" } },

  -- Java?
  -- java_language_server = { single_file_support = true, cmd = { '/home/kevin/Documents/java-language-server/dist/lang_server_linux.sh' } },

  -- Low Level
  clangd = {
    single_file_support = true,
    cmd = { "clangd", "--header-insertion=never" }
  },
  arduino_language_server = {},
  -- ccls = { single_file_support = true },
  zls = {},
  rust_analyzer = {},

  cmake = { root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake", "CMakeLists.txt" } },

  ltex_plus = { filetypes = { "nothing" } }, -- Very heavy english language server
  -- harper_ls = { filetypes = { "markdown", "text" } },
  -- markdown_oxide = {},
}

local include_env = os.getenv("Include") or ""
if os.getenv("CC") == "gcc.exe"
and string.find(include_env, "ucrt64-mingw64-mcf-gcc", 1, true) then
  servers.clangd.init_options = {
    fallbackFlags = { "--target=x86_64-w64-mingw32" }
  }
end

-- 4. Register and Enable Servers
local server_names = {}
for name, opts in pairs(servers) do
  table.insert(server_names, name)
  -- Only call vim.lsp.config if configuration required
  if next(opts) ~= nil then
    vim.lsp.config(name, opts)
  end
end

vim.lsp.enable(server_names)

-- 5. LspAttach Autocommand
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    local map = vim.keymap.set
    local function opts(desc)
      return { buffer = ev.buf, desc = "LSP " .. desc }
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
    -- map("n", "<leader>ra", function()
    map("n", "<leader>lr", require "nvchad.lsp.renamer", opts "NvRenamer")
  end
})
