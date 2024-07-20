local map = vim.keymap.set


-- Floating diagnostics
map('n', '<leader>lf', vim.diagnostic.open_float, { desc = "Floating Diagnostic" })
map('n', '<leader>ln', vim.diagnostic.goto_next, { desc = "Goto next error" })
-- Advanced lsp diagnostics
map('n', 'g?', function () require('trouble').toggle('diagnostics') end, { desc = "Error List" })

-- Location list (replaced by trouble)
-- map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
