return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[
          ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
          ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
          ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
          ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
          ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
          ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

          [pauvilella]
]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          actions = {
            copy_file_path = {
              action = function(_, item)
                if not item then
                  return
                end

                local vals = {
                  ["Basename"] = vim.fn.fnamemodify(item.file, ":t:r"),
                  ["Extension"] = vim.fn.fnamemodify(item.file, ":t:e"),
                  ["Filename"] = vim.fn.fnamemodify(item.file, ":t"),
                  ["Path"] = item.file,
                  ["Path (CWD)"] = vim.fn.fnamemodify(item.file, ":."),
                  ["Path (HOME)"] = vim.fn.fnamemodify(item.file, ":~"),
                  ["Uri"] = vim.uri_from_fname(item.file),
                }

                local options = vim.tbl_filter(function(val)
                  return vals[val] ~= ""
                end, vim.tbl_keys(vals))
                if vim.tbl_isempty(options) then
                  vim.notify("No values to copy", vim.log.levels.WARN)
                  return
                end
                table.sort(options)
                vim.ui.select(options, {
                  prompt = "Choose to copy to clipboard:",
                  format_item = function(list_item)
                    return ("%s: %s"):format(list_item, vals[list_item])
                  end,
                }, function(choice)
                  local result = vals[choice]
                  if result then
                    vim.fn.setreg("+", result)
                    Snacks.notify.info("Yanked `" .. result .. "`")
                  end
                end)
              end,
            },
            search_in_directory = {
              action = function(_, item)
                if not item then
                  return
                end
                local dir = vim.fn.fnamemodify(item.file, ":p:h")
                Snacks.picker.grep({
                  cwd = dir,
                  cmd = "rg",
                  args = {
                    "-g",
                    "!.git",
                    "-g",
                    "!node_modules",
                    "-g",
                    "!dist",
                    "-g",
                    "!build",
                    "-g",
                    "!coverage",
                    "-g",
                    "!.DS_Store",
                    "-g",
                    "!.docusaurus",
                    "-g",
                    "!.dart_tool",
                  },
                  show_empty = true,
                  hidden = true,
                  ignored = true,
                  follow = false,
                  supports_live = true,
                })
              end,
            },
            diff = {
              action = function(picker)
                picker:close()
                local sel = picker:selected()
                if #sel > 0 and sel then
                  Snacks.notify.info(sel[1].file)
                  vim.cmd("tabnew " .. sel[1].file)
                  vim.cmd("vert diffs " .. sel[2].file)
                  Snacks.notify.info("Diffing " .. sel[1].file .. " against " .. sel[2].file)
                  return
                end

                Snacks.notify.info("Select two entries for the diff")
              end,
            },
          },
          win = {
            list = {
              keys = {
                ["y"] = "copy_file_path",
                ["s"] = "search_in_directory",
                ["D"] = "diff",
              },
            },
          },
        },
      },
    },
  },
}
