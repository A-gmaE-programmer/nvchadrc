return {
	"williamboman/mason.nvim",
  opts = function()
    return require "configs.mason_opts"
  end,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "mason")
    require("mason").setup(opts)

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      -- Using nvchad/ui
      require("nvchad.mason").install_all(opts.ensure_installed)
    end, {})
  end,
}
