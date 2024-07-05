return {
	"williamboman/mason.nvim",
	opts = {
    ensure_installed = {
      -- Lua stuff
      "lua-language-server",
      "stylua",

      -- web dev stuff
      "css-lsp",
      "html-lsp",
      "htmx-lsp",
      "json-lsp",
      "typescript-language-server",
      "tailwindcss-language-server",
      "deno",
      "prettier",
      "prettierd",
      "biome",
      "quick-lint-js",

      -- scripting
      "bash-language-server",
      "bash-debug-adapter",
      "shfmt",
      "pyright",

      -- c cpp zig
      "clangd",
      "cpplint",
      "zls",
    },
	},
}
