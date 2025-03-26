return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    delay = 0,
    spec = {
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>b', group = '[B]uffer' },
      { '<leader>n', group = '[N]eotree' },
      { '<leader>m', group = '[M]arkdown' },
      { '<leader>y', group = '[Y]aml' },
      { '<leader>d', group = '[D]ocument or [D]ebug' },
      { '<leader>r', group = '[R]ename or [R]eload' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  },
}
