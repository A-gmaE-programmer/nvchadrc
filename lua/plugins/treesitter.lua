return {
	"nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = function()
    return require "configs.treesitter_opts"
  end,
  config = function(_, opts)
    pcall(function()
      dofile(vim.g.base46_cache .. "syntax")
      dofile(vim.g.base46_cache .. "treesitter")
    end)
    require("nvim-treesitter").install(opts.ensure_installed)

    print(opts.ensure_installed)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = opts.ensure_installed,
      callback = function()
        vim.treesitter.start()                                -- highlighting
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'   -- folds
        -- vim.wo.foldmethod = 'expr'
        -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = opts.indent.enable,
      callback = function()
        -- vim.treesitter.start()                                -- highlighting
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'   -- folds
        -- vim.wo.foldmethod = 'expr'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
      end,
    })

  end,
}
