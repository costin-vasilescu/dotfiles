return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			-- visuals
			direction = "float",
			float_opts = {
				border = "curved",
				width = 100,
				height = 30,
			},
			shade_terminals = false,

			-- functionality
			start_in_insert = true,
			persist_size = false,
			persist_mode = true,
			close_on_exit = true,
			auto_scroll = true,
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)

			-- Escape from terminal mode
			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*toggleterm#*",
				callback = function(event)
					local map_opts = { buffer = event.buf }
					vim.keymap.set("t", "<S-Esc>", [[<C-\><C-n>]], map_opts)
				end,
			})
		end,
	},
}
