return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  cmd = { "PeekOpen", "PeekClose" },
  opts = {
    app = { 'chromium', '--new-window' },
  },
  config = function(_, opts)
    require("peek").setup(opts)
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  end,
}
