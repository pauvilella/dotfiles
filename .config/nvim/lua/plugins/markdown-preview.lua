-- Added for Previewing markdown file in a web browser while editing them
return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = ':call mkdp#util#install()',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.g.mkdp_auto_close = 1
    vim.keymap.set('n', '<leader>mp', ':MarkdownPreviewToggle<cr>', { noremap = true, silent = true, desc = 'Toogle Markdown Preview in a broser tab' })
  end,
  ft = { 'markdown' },
}
