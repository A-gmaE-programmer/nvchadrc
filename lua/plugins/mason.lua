local options = {
  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },

  max_concurrent_installers = 10,

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
}

return {
	"williamboman/mason.nvim",
  opts = options,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "mason")
    require("mason").setup(opts)

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      -- Using nvchad/ui
      require("nvchad.mason").install_all(opts.ensure_installed)
    end, {})
  end,
}
