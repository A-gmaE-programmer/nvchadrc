vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- If there is no info on lazy: clone the git repo and load it
if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "autocmds"

vim.schedule(function()
  -- require "mappings"
  require 'mappings.m'
end)

-- Conform format command
vim.api.nvim_create_user_command(
  'Format',
  function (args)
    local range = nil
    if args.count ~= -1 then
      local end_line = vim.api.nvim_buf_get_lines(
        0,
        args.line2 - 1,
        args.line2,
        true
      )[1]
      range = {
        start = { args.line1, 0 },
        ["end"] = { args.line2, end_line:len() },
      }
    end
    require("conform").format({
      async = true,
      lsp_fallback = true,
      range = range,
    })
  end,
  { range = true }
)

-- vim.diagnostic.config {
--   float = {
--     border = 'rounded'
--   }
-- }

-- Ctrl + H for tty
vim.schedule(
  function()
    if vim.env.TERM == "linux" then
      vim.keymap.del("i", "<C-h>")
      -- vim.keymap.set("i", "<C-h>", "<BS>")
    end
  end
)

