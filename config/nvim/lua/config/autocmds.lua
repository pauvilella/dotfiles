-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- grug-far displays its buffer before mapping keys (grug-far.lua:303 vs :319), so
-- which-key's BufEnter snapshot misses the <localleader> mappings and never installs
-- the `\` trigger. Its cache is only invalidated on LspAttach/BufReadPost/BufNew, none
-- of which fire for a nofile buffer, so force a rescan once the mappings exist.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("grug_far_which_key_refresh", { clear = true }),
  pattern = "grug-far",
  callback = function(ev)
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(ev.buf) then
        return
      end
      pcall(function()
        require("which-key.buf").clear({ buf = ev.buf })
      end)
    end)
  end,
})
