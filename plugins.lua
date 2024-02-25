local overrides = require("custom.configs.overrides")

local plugins = {
  -- in order to modify the lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function ()
      require "custom.configs.conform"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = overrides.trouble
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ops = overrides.todoComments
  }
}

return plugins
