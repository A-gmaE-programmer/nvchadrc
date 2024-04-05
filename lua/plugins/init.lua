return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = false,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ops = {}
  },
  {
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
  },
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
      highlight = {
        enable = true,
      },
      ensure_installed = {
        "c", "cpp", "zig",

        "css", "html", "javascript",
        "jsdoc", "typescript", "tsx",

        "bash", "python", "lua",

        "markdown", "markdown_inline", "query",
        "vim", "vimdoc",
      },
      indent = {
        enable = true,
        disable = {
          "python"
        }
      },
      compilers = {
        "clang",
        "gcc",
      },
  	},
  },
}
