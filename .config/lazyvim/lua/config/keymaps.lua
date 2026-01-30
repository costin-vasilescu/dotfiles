-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle LSP
vim.keymap.set("n", "<leader>cL", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    vim.cmd("LspStop")
    vim.notify("LSP stopped", vim.log.levels.INFO)
  else
    vim.cmd("LspStart")
    vim.notify("LSP started", vim.log.levels.INFO)
  end
end, { desc = "Toggle LSP" })
