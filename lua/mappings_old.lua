require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fm", function () require("conform").format() end, { desc = "formatting" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- LSP info
map({'n', 'v'}, 'K', vim.lsp.buf.hover, { noremap = true, desc = "Lsp Info" })

-- Floating lsp diagnostics
map('n', '<leader>lq', vim.lsp.buf.code_action, { noremap = true, desc = "Quick Fix" })
map('n', '<leader>lf', vim.diagnostic.open_float, { noremap = true, desc = "Floating Diagnostic" })
map('n', '<leader>ln', vim.diagnostic.goto_next, { noremap = true, desc = "Goto next error" })
-- Advanced lsp diagnostics
map('n', 'g?', function () require('trouble').toggle() end, { desc = "Error List" })

-- Session switcher
map('n', '<leader>ss', require('auto-session.session-lens').search_session, { noremap = true })

-- Lazy
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>M", "<cmd>Mason<CR>", { noremap = true, silent = true })

-- tab out
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
