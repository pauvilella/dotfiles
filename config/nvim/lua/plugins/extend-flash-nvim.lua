return {
  "folke/flash.nvim",
  opts = {
    modes = {
      char = {
        -- this is to not use the ';' for “find next” behaviour
        -- I use the ';' as a shortcut of 'gs' (for go surround)
        -- check in: @./extend-mini-surround.lua
        keys = { "f", "F", "t", "T" },
      },
    },
  },
}
