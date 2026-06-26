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
}
