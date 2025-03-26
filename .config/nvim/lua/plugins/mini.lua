return {
  'echasnovski/mini.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('mini.ai').setup()
    require('mini.surround').setup()
    require('mini.notify').setup()
    require('mini.pairs').setup()
    require('mini.tabline').setup()
    require('mini.comment').setup()
    require('mini.bufremove').setup()
    require('mini.files').setup {
      windows = {
        preview = true,
        width_preview = 75,
      },
    }
    vim.keymap.set('n', 'f', function()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
      MiniFiles.open(path)
      MiniFiles.reveal_cwd()
    end, { desc = 'Open Mini [F]iles' })
    require('mini.move').setup {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
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

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    }
  end,
}
