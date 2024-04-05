require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fm", function () require("conform").format() end, { desc = "formatting" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Advanced lsp diagnostics
map('n', 'g?', function () require('trouble').toggle() end)

-- Session switcher
map('n', '<leader>ss', require('auto-session.session-lens').search_session, { noremap = true })

-- tabout
map('i', '<tab>', function ()
  local col = vim.fn.col(".")
  --local lastcol = vim.fn.col("$") - 1
  local overChar = vim.api.nvim_get_current_line():sub(col, col)
  if overChar == '' then
    return '<tab>'
  end
  if string.find(')]}"\'>', overChar) then
    --and not overChar == '' 
    return '<c-o>a'
  end
  return '<tab>'
end, { expr = true })
