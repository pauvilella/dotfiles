return {
  'echasnovski/mini.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('mini.ai').setup()
    require('mini.surround').setup()
    require('mini.pairs').setup()
    require('mini.tabline').setup()
    require('mini.comment').setup()
    require('mini.move').setup {
      mappings = {
        -- Move visual selection in Visual mode.
        left = '<S-h>',
        right = '<S-l>',
        down = '<S-j>',
        up = '<S-k>',
        -- Move current line in Normal mode
        line_left = '<S-h>',
        line_right = '<S-l>',
        line_down = '<S-j>',
        line_up = '<S-k>',
      },
      options = {
        reindent_linewise = true,
      },
    }
  end,
}
