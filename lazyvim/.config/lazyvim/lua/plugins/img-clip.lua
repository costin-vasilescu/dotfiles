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
		config = function(_, opts)
			require("img-clip").setup(opts)
			-- Extension fix (drag-and-drop / path pastes):
			--
			-- `paste_image_from_path` (used for drag-and-drop and `:PasteImage
			-- <path>`) derives the output file's extension from the *source*
			-- file's extension, only falling back to the configured
			-- `extension` option when the source has none at all. Since
			-- `process_cmd` re-encodes the image bytes to a different format
			-- (avif), dragging in a `.png` results in a copied file that's
			-- actually AVIF-encoded but still named `.png`. Force the
			-- configured extension whenever we're copying + processing.
			do
				local paste = require("img-clip.paste")
				local config = require("img-clip.config")
				local fs = require("img-clip.fs")
				local markup = require("img-clip.markup")
				local original_paste_image_from_path = paste.paste_image_from_path

				paste.paste_image_from_path = function(src_path)
					if
						config.get_opt("embed_image_as_base64")
						or not config.get_opt("copy_images")
						or config.get_opt("process_cmd") == ""
					then
						return original_paste_image_from_path(src_path)
					end

					local extension = config.get_opt("extension")

					local file_path = fs.get_file_path(extension)
					if not file_path then
						util.error("Could not determine file path.")
						return false
					end

					local dir_path = vim.fn.fnamemodify(file_path, ":h")
					if not fs.mkdirp(dir_path) then
						util.error("Could not create directories.")
						return false
					end

					if not fs.copy_file(src_path, file_path) then
						util.error("Could not copy image.")
						return false
					end

					local output, exit_code = fs.process_image(file_path)
					if exit_code ~= 0 then
						util.warn("Could not process image.", true)
						util.warn("Output: " .. output, true)
					end

					if not markup.insert_markup(file_path, true) then
						util.error("Could not insert markup code.")
						return false
					end

					return true
				end
			end
		end,
	},
}
