return {
	{ "catppuccin/nvim", enabled = false },

	{ "folke/tokyonight.nvim", enabled = false },

	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Configure settings before calling colorscheme
			vim.g.gruvbox_material_foreground = "material" -- material, mix, original
			vim.g.gruvbox_material_background = "medium" -- hard, medium, soft
			vim.g.gruvbox_material_ui_contrast = "low" -- low, high
			vim.g.gruvbox_material_float_style = "dim" -- bright, dim, blend
			vim.g.gruvbox_material_enable_bold = true
			vim.g.gruvbox_material_enable_italic = false
			vim.g.gruvbox_material_better_performance = 1
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox-material",
		},
	},
}
