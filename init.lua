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
  pattern = { "*.ts", "typescript", "javascript" },
  callback = function ()
    vim.cmd("setlocal shiftwidth=4")
    vim.cmd("echo 'setting shiftwidth to 4'")
  end
})

-- Advanced lsp diagnostics
vim.keymap.set('n', 'g?', function () require('trouble').toggle() end)

-- Conform format command
vim.api.nvim_create_user_command(
  'Format',
  function (args)
    local range = nil
    if args.count ~= -1 then
      local end_line = vim.api.nvim_buf_get_lines(
        0,
        args.line2 - 1,
        args.line2,
        true
      )[1]
      range = {
        start = { args.line1, 0 },
        ["end"] = { args.line2, end_line:len() },
      }
    end
    require("conform").format({
      async = true,
      lsp_fallback = true,
      range = range,
    })
  end,
  { range = true }
)

-- Deno codefences
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
