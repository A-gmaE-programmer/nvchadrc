return {
  "jbyuki/nabla.nvim",
  event = { "BufReadPost *md", "BufWritePost *md", "BufNewFile *md" },
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { "*.md", "*.markdown", "md", "markdown" },
      callback = function ()
        pcall(vim.keymap.del, 'n', 'K', { buffer = 0 })
        vim.keymap.set("n", "K",
          function ()
            if require('nabla.utils').in_mathzone() then
              require("nabla").popup({ border = 'rounded' })
            else
              vim.lsp.buf.hover()
            end
          end,
          {
            noremap = true,
            desc = "Nabla latex view",
            buffer = true,
          })
      end
    })
  end,
}
