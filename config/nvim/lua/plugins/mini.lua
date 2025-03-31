return {
  "echasnovski/mini.move",
  opts = {
    mappings = {
      -- Move visual selection in Visual mode.
      left = "<S-h>",
      right = "<S-l>",
      down = "<S-j>",
      up = "<S-k>",

      -- Move current line in Normal mode
      line_left = "<S-h>",
      line_right = "<S-l>",
      line_down = "<S-j>",
      line_up = "<S-k>",
    },

    -- Options which control moving behavior
    options = {
      -- Automatically reindent selection during linewise vertical move
      reindent_linewise = true,
    },
  },
}
