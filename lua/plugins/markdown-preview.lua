return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown", "md" },
  build = "cd app && npm install",
  init = function ()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
