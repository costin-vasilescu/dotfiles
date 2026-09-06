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

-- Keymap to open Obsidian-style image links under cursor with a local image viewer
vim.keymap.set("n", "gx", function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.fn.col(".")

  -- Image extensions to route to the external viewer
  local img_exts = { webp = true, png = true, jpg = true, jpeg = true, gif = true, svg = true, bmp = true }

  -- Look for wiki-style links (with or without the leading !)
  for start_idx, target_path, end_idx in line:gmatch("()!?%[%[(.-)%]%]()") do
    if col >= start_idx and col < end_idx then
      -- Strip any anchor/alias like ![[image.png|300]] or [[note#heading]]
      local clean_path = target_path:match("^([^|#]+)") or target_path
      local ext = clean_path:match("%.([^%.]+)$")

      -- Only route to external image viewer if it has an image extension
      if ext and img_exts[ext:lower()] then
        local cmd
        if vim.fn.has("unix") == 1 then
          cmd = { "gwenview", "-f", clean_path }
        end

        if cmd then
          vim.fn.jobstart(cmd, { detach = true })
          return
        end
      end
    end
  end

  -- Fallback: default `gx` in Neovim 0.10+ (vim.ui.open on the path/url under cursor)
  vim.ui.open(vim.fn.expand("<cfile>"))
end, { desc = "Open images externally, notes in Neovim, and URLs in browser" })
