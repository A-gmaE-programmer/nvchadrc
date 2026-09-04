return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    dofile(vim.g.base46_cache .. "lsp")
    dofile(vim.g.base46_cache .. "semantic_tokens")
    require "configs.lspconfig"
  end,
}
