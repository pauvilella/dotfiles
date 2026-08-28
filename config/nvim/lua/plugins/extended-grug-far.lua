return {
  "MagicDuck/grug-far.nvim",
  keys = {
    {
      "<leader>sv",
      function()
        require("grug-far").with_visual_selection({
          prefills = {
            paths = vim.fn.expand("%"),
          },
        })
      end,
      mode = "x",
      desc = "Search and Replace (visual selection)",
    },
  },
}
