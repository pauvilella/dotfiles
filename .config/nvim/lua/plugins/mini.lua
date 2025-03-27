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
        left = '<A-h>',
        right = '<A-l>',
        down = '<A-j>',
        up = '<A-k>',
        -- Move current line in Normal mode
        line_left = '<A-h>',
        line_right = '<A-l>',
        line_down = '<A-j>',
        line_up = '<A-k>',
      },
      options = {
        reindent_linewise = true,
      },
    }
  end,
}
