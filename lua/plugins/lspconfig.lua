return {
  "neovim/nvim-lspconfig",
  event = "User FilePost",
  config = function()
    dofile(vim.g.base46_cache .. "lsp")
    require "configs.lspconfig"
  end,
}
