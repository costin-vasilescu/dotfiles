return {
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			-- LazyVim defaults to theme = "auto", force it to use gruvbox-material
			opts.options.theme = "gruvbox-material"
		end,
	},

	-- Override Bufferline highlights to blend seamlessly with the soft background
	{
		"akinsho/bufferline.nvim",
		opts = {
			highlights = {
				fill = {
					bg = { attribute = "bg", highlight = "Normal" },
				},
				background = {
					bg = { attribute = "bg", highlight = "StatusLine" },
				},
			},
			options = {
				separator_style = "slant",
			},
		},
	},

	{
		"sphamba/smear-cursor.nvim",
		opts = {
			legacy_computing_symbols_support = true,
		},
	},
}
