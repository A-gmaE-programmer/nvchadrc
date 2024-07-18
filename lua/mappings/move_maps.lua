local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- tab out
map('i', '<tab>', function ()
  local col = vim.fn.col(".")
  --local lastcol = vim.fn.col("$") - 1
  local overChar = vim.api.nvim_get_current_line():sub(col, col)
  if overChar == '' then
    return '<tab>'
  end
  if string.find(')]}"\'>', overChar, 1, true) then
    --and not overChar == '' 
    return '<c-o>a'
  end
  return '<tab>'
end, { expr = true })

-- Window jumping
-- map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
-- map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
-- map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
-- map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Insert mode movement
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

