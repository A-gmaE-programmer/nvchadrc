-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "flexoki",
  theme_toggle = { "flexoki", "flexoki-light" },
  transparency = false,
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

M.ui = {
  telescope = { style = "bordered" },
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
        local status, ret = pcall(require('auto-session.lib').current_session_name)
        if status then
          return "%#ST_autosession#-> " .. ret .. " "
        else
          return ""
        end
      end,
    },
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "     .---------------------o--------------o---o +1.5V",
      "     |                     |              |          ",
      "     |                     |              |          ",
      "    .-.         ||100n     |             .-.         ",
      "    | |    .----||----.    |             | |         ",
      "   100k    |    ||    |    |             | |1k       ",
      "    '-'    |    ___   |  |<              '-'         ",
      "     |     o---|___|--o--|                |          ",
      "     |     |    1k       |\\               |          ",
      "     |   |/                |              |          ",
      "     o---|                 |              |          ",
      "L    |   |>                |              |          ",
      "E    |     |               |              |          ",
      "D    |     |    \\]         |     \\]       |          ",
      "     '-----)----|]---------o-----|]-------o          ",
      "B          |    /]+        |     /]+      |          ",
      "l          |    10µ       .-.    100µ     |          ",
      "i          |              | |             |          ",
      "n          |              | |47Ω          V ->       ",
      "k          |              '-'             -          ",
      "e          |               |              |          ",
      "r          '---------------o--------------o---o GND  ",
    }
  }
}

return M
