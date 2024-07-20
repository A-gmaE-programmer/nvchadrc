return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { 'Trouble' },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      highlight = {
        before = "fg",
        keyword = "bg",
        pattern = [[<(KEYWORDS)\s*]],
      }
    },
    -- config = function (_, opts)
    --   require("todo-comments").setup(opts)
    -- end,
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
    end,
  },
}

-- PERF: asdfad
-- test
-- HACK: asfdadf
-- test
-- TODO: asdfadf
-- test
-- NOTE: dsaf
-- test
-- FIX: asdfads
-- test
-- WARNING: asfdadf
-- test

