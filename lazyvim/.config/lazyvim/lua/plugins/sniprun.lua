return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>r", group = "run" },
      },
    },
  },
  {
    "michaelb/sniprun",
    build = "sh install.sh 1",
    opts = {
      display = {
        "LongTempFloatingWindow",
        "VirtualTextOk",
      },
      repl_enable = { "Python3_fifo" },
    },
    keys = {
      {
        "<F5>",
        function()
          local cur = vim.fn.line(".")
          vim.api.nvim_buf_set_mark(0, "<", 1, 0, {})
          vim.api.nvim_buf_set_mark(0, ">", cur, 0, {})
          vim.cmd("'<,'>SnipRun")
        end,
        mode = "n",
        desc = "Run from top to current line",
      },
      {
        "<C-F5>",
        function()
          local cur = vim.fn.line(".")
          local last = vim.fn.line("$")
          vim.api.nvim_buf_set_mark(0, "<", cur, 0, {})
          vim.api.nvim_buf_set_mark(0, ">", last, 0, {})
          vim.cmd("'<,'>SnipRun")
        end,
        mode = "n",
        desc = "Run from current line to bottom",
      },
      { "<F5>", ":'<,'>SnipRun<cr>", mode = "v", desc = "Run selection" },
      { "<leader>cc", "<cmd>SnipClose<cr>", desc = "Close sniprun" },
      { "<leader>cC", "<cmd>SnipReset<cr>", desc = "Reset sniprun" },
    },
  },
}
