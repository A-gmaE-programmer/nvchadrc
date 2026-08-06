-- vscode format
require("luasnip.loaders.from_vscode").lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
require("luasnip.loaders.from_vscode").lazy_load { vim.fn.stdpath 'config' }

-- snipmate format
require("luasnip.loaders.from_snipmate").load()
require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

-- lua format
require("luasnip.loaders.from_lua").load()
require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Use autosnippets so they expand without pressing Tab
ls.add_snippets("all", {
  s("rarrow", t("→")),
  s("larrow", t("←")),
  s("uarrow", t("↑")),
  s("darrow", t("↓")),
}, { type = "autosnippets" })

-- ls.add_snippets("all", {
--   s("right arrow", t("→")),
--   s("left arrow",  t("←")),
--   s("up arrow",    t("↑")),
--   s("down arrow",  t("↓")),
-- })

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if
      require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})
