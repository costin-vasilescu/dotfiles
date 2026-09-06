return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- use latest release, remove to use latest commit
		---@module 'obsidian'
		---@type obsidian.config
		opts = {
			legacy_commands = false,
			workspaces = {
				{
					name = "Notes",
					path = "~/Documents/Notes/",
				},
			},
			picker = { name = "snacks.picker" },
		},
	},
}
