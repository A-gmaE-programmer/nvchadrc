--@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tokyodark",
  theme_toggle = { "tokyodark", "everforest_light" },
  statusline = {
    -- modules arg here is the default table of modules
    overriden_modules = function (modules)
      table.insert(
        modules,
        5,
        (function ()
          local info = vim.fn.getpos(".")
          local line = info[2]
          local col = info[3]
          local lastline = vim.fn.line("$")
          return "%#ST_location#" .. "col " .. col .. ", " .. line .. " of " ..lastline .. " lines"
        end)()
      )
    end,
  },
  hl_override = highlights.override,
  hl_add = highlights.add,
}

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
