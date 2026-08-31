return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				marksman = {
					enabled = false,
				},
				markdown_oxide = {
					-- Ensure that dynamicRegistration is enabled
					-- This allows the LS to take into account actions like Create Unresolved File, etc
					capabilities = vim.tbl_deep_extend(
						"force",
						vim.lsp.protocol.make_client_capabilities(),
						require("blink.cmp").get_lsp_capabilities(),
						{
							workspace = {
								didChangeWatchedFiles = {
									dynamicRegistration = true,
								},
							},
						}
					),
					on_attach = function(client, bufnr)
						-- https://oxide.md/index#Getting+Started -> "Enable opening daily notes with natural language"
						-- :Daily two days ago | :Daily next monday | :Daily prev | :Daily next | :Daily +7 | :Daily -3
						vim.api.nvim_create_user_command("Daily", function(args)
							-- nargs = "*" gives an empty string (not nil) when no args are passed.
							-- The server needs an actual nil/null here to default to "today".
							local input = args.args ~= "" and args.args or vim.NIL
							client.request("workspace/executeCommand", {
								command = "jump",
								arguments = { input },
							}, nil, bufnr)
						end, { desc = "Open daily note", nargs = "*" })
					end,
				},
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				-- https://github.com/Feel-ix-343/markdown-oxide
				"markdown-oxide",
			})
		end,
	},
}
