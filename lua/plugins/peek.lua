return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  cmd = { "PeekOpen", "PeekClose" },
  config = function()
    require("peek").setup({
      app = { 'chromium', '--new-window' },
    })
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  end,
}
