local function tabout()
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
end

vim.keymap.set('i', '<tab>', tabout, { expr = true })
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd('FileType', {
  pattern = {"*.ts", "typescript", "javascript" },
  callback = function ()
    vim.cmd("setlocal shiftwidth=4")
    vim.cmd("echo 'setting shiftwidth to 4'")
  end
})

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'sh',
--   callback = function()
--     vim.lsp.start({
--       name = 'bash-language-server',
--       cmd = { 'bash-language-server', 'start' },
--     })
--   end,
-- })

-- Deno codefences
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

