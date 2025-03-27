return {
  'folke/snacks.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          auto_close = false,
          hidden = true,
          layout = {
            preview = false,
          },
          actions = {
            copy_file_path = {
              action = function(_, item)
                if not item then
                  return
                end

                local vals = {
                  ['Basename'] = vim.fn.fnamemodify(item.file, ':t:r'),
                  ['Extension'] = vim.fn.fnamemodify(item.file, ':t:e'),
                  ['Filename'] = vim.fn.fnamemodify(item.file, ':t'),
                  ['Path'] = item.file,
                  ['Path (CWD)'] = vim.fn.fnamemodify(item.file, ':.'),
                  ['Path (HOME)'] = vim.fn.fnamemodify(item.file, ':~'),
                  ['Uri'] = vim.uri_from_fname(item.file),
                }

                local options = vim.tbl_filter(function(val)
                  return vals[val] ~= ''
                end, vim.tbl_keys(vals))
                if vim.tbl_isempty(options) then
                  vim.notify('No values to copy', vim.log.levels.WARN)
                  return
                end
                table.sort(options)
                vim.ui.select(options, {
                  prompt = 'Choose to copy to clipboard:',
                  format_item = function(list_item)
                    return ('%s: %s'):format(list_item, vals[list_item])
                  end,
                }, function(choice)
                  local result = vals[choice]
                  if result then
                    vim.fn.setreg('+', result)
                    Snacks.notify.info('Yanked `' .. result .. '`')
                  end
                end)
              end,
            },
            search_in_directory = {
              action = function(_, item)
                if not item then
                  return
                end
                local dir = vim.fn.fnamemodify(item.file, ':p:h')
                Snacks.picker.grep {
                  cwd = dir,
                  cmd = 'rg',
                  args = {
                    '-g',
                    '!.git',
                    '-g',
                    '!node_modules',
                    '-g',
                    '!dist',
                    '-g',
                    '!build',
                    '-g',
                    '!coverage',
                    '-g',
                    '!.DS_Store',
                    '-g',
                    '!.docusaurus',
                    '-g',
                    '!.dart_tool',
                  },
                  show_empty = true,
                  hidden = true,
                  ignored = true,
                  follow = false,
                  supports_live = true,
                }
              end,
            },
            diff = {
              action = function(picker)
                picker:close()
                local sel = picker:selected()
                if #sel > 0 and sel then
                  Snacks.notify.info(sel[1].file)
                  vim.cmd('tabnew ' .. sel[1].file)
                  vim.cmd('vert diffs ' .. sel[2].file)
                  Snacks.notify.info('Diffing ' .. sel[1].file .. ' against ' .. sel[2].file)
                  return
                end

                Snacks.notify.info 'Select two entries for the diff'
              end,
            },
          },
          win = {
            list = {
              keys = {
                ['y'] = 'copy_file_path',
                ['s'] = 'search_in_directory',
                ['D'] = 'diff',
              },
            },
          },
        },
      },
    },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- Top Pickers & Explorer
    {
      '<leader><space>',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart Find Files',
    },
    {
      '<leader>,',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>n',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'File Explorer',
    },
  },
}
