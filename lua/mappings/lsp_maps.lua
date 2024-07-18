local map = vim.keymap.set

-- LSP info
map({'n', 'v'}, 'K', vim.lsp.buf.hover, { noremap = true, desc = "Lsp Info" })

-- Floating lsp diagnostics
map('n', '<leader>lq', vim.lsp.buf.code_action, { noremap = true, desc = "Quick Fix" })
map('n', '<leader>lf', vim.diagnostic.open_float, { noremap = true, desc = "Floating Diagnostic" })
map('n', '<leader>ln', vim.diagnostic.goto_next, { noremap = true, desc = "Goto next error" })
-- Advanced lsp diagnostics
map('n', 'g?', function () require('trouble').toggle('diagnostics') end, { desc = "Error List" })

-- Location list (replaced by trouble)
-- map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
