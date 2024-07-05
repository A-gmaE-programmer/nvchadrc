return {
  "rmagatti/auto-session",
  lazy = false,
  opts = {
    auto_session_enabled = true,
    -- auto_save_enabled = true,
    log_level = "info",
    cwd_change_handling = {
    -- example refreshing the lualine status line _after_ the cwd changes
    post_cwd_changed_hook = function()
      -- refresh lualine so the new session name is displayed in the status bar
      require("lualine").refresh()
    end,
    session_lens = {
        load_on_setup = true,
        theme_conf = { border = true }
      }
    },
  }
}
