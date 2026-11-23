return {
  "quarto-dev/quarto-nvim",
  dependencies = {
    "jmbuhr/otter.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = "quarto",
  opts = {},
  keys = {
    { "<leader>cp", "<cmd>QuartoPreview<cr>", ft = "quarto", desc = "Quarto Preview" },
  },
}
