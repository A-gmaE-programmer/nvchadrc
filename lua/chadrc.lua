-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "onedark",
  theme_toggle = { "tokyodark", "everforest_light" },
  statusline = {
    order = { "mode", "file", "git", "%=", "cursorStats", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "session", "cursor" },
    modules = {
      cursorStats = function()
        local info = vim.fn.getpos(".")
        local line = info[2]
        local col = info[3]
        local lastline = vim.fn.line("$")
        return "%#ST_location#" .. "col " .. col .. ", " .. line .. " of " ..lastline .. " lines"
      end,
      session = function()
        -- Session name getter
        local sng = require('auto-session.lib').current_session_name
        if sng then
          return "%#ST_autosession#-> " .. require('auto-session.lib').current_session_name() .. " "
        else
          return ""
        end
      end,
    },
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
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
    ST_location = { fg = "blue", bg = "statusline_bg" },
    ST_autosession = { fg = "purple", bg = "one_bg" }
  },
}

return M
