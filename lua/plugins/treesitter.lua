return {
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
}
