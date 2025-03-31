return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- Disable the K keymap for hover (I use it to move the line up in normal mode)
    keys[#keys + 1] = { "K", mode = { "n" }, false }
  end,
}
