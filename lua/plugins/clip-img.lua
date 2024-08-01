local function get_last_args()
  local last_cmd = vim.fn.histget(":", -1)
  local cmd_args = vim.split(last_cmd, " ")
  return cmd_args
end

return {
  "ekickx/clipboard-image.nvim",
  cmd = { "PasteImg" },
  opts = {
    markdown = {
      img_dir = "pasted_img",
      img_dir_txt = "/pasted_img",
      img_name = function ()
        local last_args = get_last_args()
        local img_name = table.concat(vim.list_slice(last_args, 2), "_")
        return os.date('%Y-%m-%d-%H-%M-%S') .. img_name
      end,
    }
  },
  config = function (_, opts)
    require("clipboard-image").setup(opts)
  end
}
