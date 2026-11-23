return {
  "snacks.nvim",
  opts = function(_, opts)
    table.insert(
      opts.dashboard.preset.keys,
      7,
      { icon = "S", key = "S", desc = "Select Session", action = require("persistence").select }
    )

    opts.image = opts.image or {}
    opts.image.enabled = true
  end,
}
