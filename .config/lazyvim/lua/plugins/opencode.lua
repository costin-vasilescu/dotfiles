return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  keys = {
    -- Main menu
    {
      "<leader>a",
      function()
        require("opencode").select()
      end,
      desc = "ai",
      mode = { "n", "x" },
    },

    -- Ask opencode
    {
      "<leader>aa",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      desc = "Ask Opencode",
      mode = { "n", "x" },
    },

    -- Select prompt
    {
      "<leader>ap",
      function()
        local prompts = {
          { name = "diagnostics", label = "Explain diagnostics" },
          { name = "diff", label = "Review git diff" },
          { name = "document", label = "Add documentation" },
          { name = "explain", label = "Explain code" },
          { name = "fix", label = "Fix diagnostics" },
          { name = "implement", label = "Implement code" },
          { name = "optimize", label = "Optimize code" },
          { name = "review", label = "Review code" },
          { name = "test", label = "Add tests" },
        }

        vim.ui.select(prompts, {
          prompt = "Select prompt:",
          format_item = function(item)
            return item.label
          end,
        }, function(choice)
          if choice then
            require("opencode").prompt(choice.name)
          end
        end)
      end,
      desc = "Select prompt",
      mode = { "n", "x" },
    },

    -- Toggle opencode
    {
      "<leader>at",
      function()
        require("opencode").toggle()
      end,
      desc = "Toggle Opencode",
      mode = { "n", "t" },
    },

    -- Operator mappings for adding ranges
    {
      "<leader>ao",
      function()
        return require("opencode").operator("@this ")
      end,
      desc = "Add range to Opencode",
      mode = { "n", "x" },
      expr = true,
    },
    {
      "<leader>aO",
      function()
        return require("opencode").operator("@this ") .. "_"
      end,
      desc = "Add line to Opencode",
      mode = "n",
      expr = true,
    },

    -- Navigation in session
    {
      "<leader>ak",
      function()
        require("opencode").command("session.half.page.up")
      end,
      desc = "Opencode half page up",
    },
    {
      "<leader>aj",
      function()
        require("opencode").command("session.half.page.down")
      end,
      desc = "Opencode half page down",
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration here
    }
    vim.o.autoread = true
  end,
}
