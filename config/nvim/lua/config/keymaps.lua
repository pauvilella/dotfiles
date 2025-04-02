-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>a", ":keepjumps normal! ggVG<cr>", { desc = "Select all" })

vim.keymap.set("n", "<leader>sx", require("snacks.picker").resume, { noremap = true, silent = true, desc = "Resume" })

vim.keymap.set("n", "<leader>k", function()
  vim.lsp.buf.hover()
end, { noremap = true, silent = true, desc = "Hover" })

vim.keymap.set(
  "v",
  "<leader>rw",
  [["hy:,$s/<C-r>h/<C-r>h/gc<left><left><left>]],
  { noremap = true, silent = true, desc = "[R]eplace [W]ord" }
)

vim.keymap.set(
  "v",
  "<leader>raw",
  [["hy:%s/<C-r>h/<C-r>h/gc<left><left><left>]],
  { noremap = true, silent = true, desc = "[R]eplace ([A]ll buffer) [W]ord" }
)
