local options = {
  lsp_fallback = true,
  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "quick-lint-js", "eslint_d", "biome" },
    typescript = { "quick-lint-js", "eslint_d", "biome" },
    jsx = { "biome", "prettier" },
    tsx = { "biome", "prettier", "prettier" },
    css = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },

    c = { "cpplint" },
    cpp = { "cpplint" },

    sh = { "shfmt" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  }
}

require("conform").setup(options)
