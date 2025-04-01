-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>a", ":keepjumps normal! ggVG<cr>", { desc = "Select all" })

vim.keymap.set("n", "<leader>sx", require("snacks.picker").resume, { noremap = true, silent = true, desc = "Resume" })

vim.keymap.set("n", "<leader>k", function()
  vim.lsp.buf.hover()
end, { noremap = true, silent = true, desc = "Hover" })
