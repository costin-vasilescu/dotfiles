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
