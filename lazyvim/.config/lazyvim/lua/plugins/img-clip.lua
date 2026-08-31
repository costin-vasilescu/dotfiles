return {
	{
		"folke/which-key.nvim",
		opts = function(_, opts)
			opts.spec = opts.spec or {}
			table.insert(opts.spec, {
				"<leader>i",
				group = "image",
				mode = { "n", "x" },
				icon = {
					icon = LazyVim.config.icons.kinds.Color,
					color = "purple",
				},
			})
		end,
	},

	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			default = {
				-- use relative paths because
				-- if I switch to another computer and I have a different username,
				-- therefore a different home directory, that's a problem because the
				-- absolute paths will be pointing to a different directory
				use_absolute_path = false, ---@type boolean

				-- make dir_path relative to current file rather than the cwd
				-- To see your current working directory run `:pwd`
				-- So if this is set to false, the image will be created in that cwd
				relative_to_current_file = true, ---@type boolean

				-- If you want to get prompted for the filename when pasting an image
				-- This is the actual name that the physical file will have
				-- If you set it to true, enter the name without spaces or extension `test-image-1`
				prompt_for_file_name = true, ---@type boolean

				-- Set the extension that the image file will have
				-- Also specifying the image options with the `process_cmd`
				extension = "avif", ---@type string
				process_cmd = "magick convert - -quality 75 avif:-", ---@type string
				copy_images = true, ---@type boolean

				-- drag and drop options
				drag_and_drop = {
					enabled = true, ---@type boolean
					insert_mode = true, ---@type boolean
				},
			},
			filetypes = {
				markdown = {
					-- encode spaces and special characters in file path
					url_encode_path = true, ---@type boolean
				},
			},
		},
		keys = {
			{ "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
}
