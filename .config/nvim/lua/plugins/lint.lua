return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = lint.linters_by_ft or {}
    lint.linters_by_ft['markdown'] = { 'markdownlint' }
    lint.linters_by_ft['dockerfile'] = { 'hadolint' }
    lint.linters_by_ft['json'] = { 'jsonlint' }
    lint.linters_by_ft['terraform'] = { 'tflint' }

    -- Create autocommand which carries out the actual linting
    -- on the specified events.
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        if vim.opt_local.modifiable:get() then
          lint.try_lint()
        end
      end,
    })
  end,
}
