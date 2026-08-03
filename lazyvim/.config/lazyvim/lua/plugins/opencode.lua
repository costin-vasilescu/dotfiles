return {
	{
		"folke/which-key.nvim",
		opts = function(_, opts)
			opts.spec = opts.spec or {}
			table.insert(opts.spec, {
				"<leader>o",
				group = "opencode",
				mode = { "n", "x" },
				icon = {
					icon = LazyVim.config.icons.kinds.Copilot,
					color = "purple",
				},
			})
		end,
	},

	{
		"sudo-tee/opencode.nvim",
		config = function()
			require("opencode").setup({})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					anti_conceal = { enabled = false },
					file_types = { "markdown", "opencode_output" },
				},
				ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
			},
			-- Optional, for file mentions and commands completion, pick only one
			"saghen/blink.cmp",
			-- 'hrsh7th/nvim-cmp',

			-- Optional, for file mentions picker, pick only one
			"folke/snacks.nvim",
			-- 'nvim-telescope/telescope.nvim',
			-- 'ibhagwan/fzf-lua',
			-- 'nvim_mini/mini.nvim',
		},
	},

	-- Avoid automatic blink.cmp menus while writing prompts
	{
    "saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      opts.completion = opts.completion or {}
      opts.completion.menu = opts.completion.menu or {}
      opts.completion.ghost_text = opts.completion.ghost_text or {}

      local inherited_auto_show = opts.completion.menu.auto_show
      local inherited_ghost_text_enabled = opts.completion.ghost_text.enabled

      opts.completion.menu.auto_show = function(ctx, items)
        if vim.bo[ctx.bufnr].filetype == "opencode" then
          -- Do not auto-open while writing prose; explicit Blink triggers still open it.
          return ctx.trigger.kind == "trigger_character"
        end

        if type(inherited_auto_show) == "function" then
          return inherited_auto_show(ctx, items)
        end
        return inherited_auto_show ~= false
      end

      opts.completion.ghost_text.enabled = function()
        local ghost_text_enabled = type(inherited_ghost_text_enabled) == "function"
            and inherited_ghost_text_enabled()
          or inherited_ghost_text_enabled == true

        if vim.bo.filetype == "opencode" then
          return ghost_text_enabled and require("blink.cmp").is_menu_visible()
        end
        return ghost_text_enabled
      end

      return opts
    end,
  },
}
