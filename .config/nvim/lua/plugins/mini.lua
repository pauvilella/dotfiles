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
  end,
}
