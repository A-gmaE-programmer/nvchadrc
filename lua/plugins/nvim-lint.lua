return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile", "BufWritePost" },
  config = function()
    local lint = require("lint")

    -- 1. Define linters by filetype
    lint.linters_by_ft = {
      -- javascript = { "eslint_d" },
      -- typescript = { "eslint_d" },
      -- javascriptreact = { "eslint_d" },
      -- typescriptreact = { "eslint_d" },
      -- python = { "pylint" },
      -- go = { "golangcilint" },
    }

    table.insert(lint.linters.pylint.args, {
      "--disable=C0111",
      "--disable=C0116",
      "--max-line-length", "120"
    })

    -- 2. Create an autocommand to trigger linting automatically
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- 3. Optional: Set up a keymap to manually force linting
    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}

