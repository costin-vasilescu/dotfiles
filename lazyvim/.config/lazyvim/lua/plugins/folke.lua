return {
	"folke/flash.nvim",
	opts = {
		jump = {
			register = true,
			history = true,
			nohlsearch = true,
		},
	},

	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				sources = {
					explorer = {
						hidden = true,
						ignored = true,
					},
					files = {
						hidden = true,
						ignored = false,
					},
					grep = {
						hidden = true,
						ignored = false,
					},
				},
			},
		},
	},
}
