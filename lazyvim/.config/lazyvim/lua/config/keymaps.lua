-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable Snacks floating terminal keymaps
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del({ "n", "t" }, "<c-/>")
vim.keymap.del({ "n", "t" }, "<c-_>")

-- Enable Toggleterm floating and tab terminals
vim.keymap.set({ "n", "t" }, "<c-/>", "<cmd>1ToggleTerm direction=float<cr>", { desc = "Toggle Terminal (Float)" })
vim.keymap.set({ "n", "t" }, "<c-\\>", "<cmd>2ToggleTerm direction=tab<cr>", { desc = "Toggle Terminal (Tab)" })
