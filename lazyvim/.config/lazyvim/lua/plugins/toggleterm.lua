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

			-- Make it easy to escape terminal-insert mode and move around
			-- (window nav, tab nav, leader mappings, etc.) without typing `exit`.
			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*toggleterm#*",
				callback = function(event)
					local map_opts = { buffer = event.buf }
					vim.keymap.set("t", "<S-Esc>", [[<C-\><C-n>]], map_opts)
					vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], map_opts)
					vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], map_opts)
					vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], map_opts)
					vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], map_opts)
				end,
			})
		end,
	},
}
