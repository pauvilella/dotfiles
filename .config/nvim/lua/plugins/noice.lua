return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    presets = {
      command_palette = true,
      bottom_search = true,
      long_message_to_split = true,
    },
    views = {
      cmdline_popup = {
        position = {
          row = 15,
          col = '50%',
        },
        size = {
          width = 60,
          height = 'auto',
        },
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
}
