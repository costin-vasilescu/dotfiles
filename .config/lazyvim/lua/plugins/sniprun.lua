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
			{ "<F5>", "<cmd>SnipRun<cr>", mode = "n", desc = "Run current line" },
			{ "<F5>", ":'<,'>SnipRun<cr>", mode = "v", desc = "Run selection" },
			{ "<leader>cc", "<cmd>SnipClose<cr>", desc = "Close sniprun" },
			{ "<leader>cC", "<cmd>SnipReset<cr>", desc = "Reset sniprun" },
		},
	},
}
