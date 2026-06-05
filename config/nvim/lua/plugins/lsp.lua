return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          -- Disable the K keymap for hover (I use it to move the line up in normal mode)
          { "K", false, mode = "n" },
        },
      },
    },
  },
}
