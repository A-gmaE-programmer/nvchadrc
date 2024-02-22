local M = {}

M.treesitter = {
  highlight = {
    enable = true,
  },
  ensure_installed = {
    "c",
    "cpp",
    "zig",

    "css",
    "html",
    "javascript",
    "jsdoc",
    "typescript",
    "tsx",

    "bash",
    "python",
    "lua",

    "markdown",
    "markdown_inline",
    "query",
    "vim",
    "vimdoc",
  },
  indent = {
    enable = true,
    disable = {
      "python"
    }
  },
  compilers = {
    "clang";
  }
}

M.mason = {
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
    "bash-debug-adapter",
    "shfmt",
    "pyright",

    -- c cpp zig
    "clangd",
    "cpplint",
    "zls",
  }
}

-- git support in nvimtree
M.nvimtree = {
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
}

return M

