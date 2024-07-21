local options = {
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  ensure_installed = {
    "c", "cpp", "zig",

    "css", "html", "javascript",
    "jsdoc", "typescript", "tsx",

    "bash", "python", "lua", "luadoc",

    "markdown", "markdown_inline", "query",
    "vim", "vimdoc",
  },
  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
  compilers = {
    "clang",
    "gcc",
  },
}

return options
