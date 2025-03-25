return {
  'someone-stole-my-name/yaml-companion.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'b0o/schemastore.nvim',
    'nvim-lualine/lualine.nvim',
  },
  config = function()
    local cfg = require('yaml-companion').setup {
      -- detect k8s schemas based on file content
      builtin_matchers = {
        kubernetes = { enabled = false },
      },

      -- schemas available in Telescope picker
      schemas = {
        -- not loaded automatically, manually select with
        -- :Telescope yaml_schema
        {
          name = 'Argo CD Application',
          uri = 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json',
        },
        {
          name = 'SealedSecret',
          uri = 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/bitnami.com/sealedsecret_v1alpha1.json',
        },
        -- schemas below are automatically loaded, but added
        -- them here so that they show up in the statusline
        {
          name = 'Kustomization',
          uri = 'https://json.schemastore.org/kustomization.json',
        },
        {
          name = 'GitHub Workflow',
          uri = 'https://json.schemastore.org/github-workflow.json',
        },
        {
          name = 'Kubernetes',
          uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json',
        },
      },

      lspconfig = {
        settings = {
          yaml = {
            format = {
              enable = true,
              singleQuote = false,
              bracketSpacing = true,
            },
            validate = true,
            completion = true,
            schemaDownload = {
              enable = false,
            },
            hover = true,
            schemaStore = {
              enable = false,
              url = '',
            },

            -- These schemas are loaded automatically
            schemas = vim.tbl_extend(
              'force',
              -- schemas from store, matched by filename
              require('schemastore').yaml.schemas {
                select = {
                  'kustomization.yaml',
                  'GitHub Workflow',
                },
              },
              -- Kubernetes schemas matched by filename
              {
                ['https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json'] = {
                  '*.{deploy,deployment}.{yml,yaml}',
                  '*.{svc,service}.{yml,yaml}',
                },
              }
            ),
          },
        },
      },
    }

    require('lspconfig')['yamlls'].setup(cfg)

    require('telescope').load_extension 'yaml_schema'
    vim.keymap.set('n', '<leader>ys', '<cmd>Telescope yaml_schema<CR>', { desc = '[Y]aml [S]chema' })

    -- get yaml schema for current buffer
    local function get_schema()
      local schema = require('yaml-companion').get_buf_schema(0)
      if schema.result[1].name == 'none' then
        return ''
      end
      return schema.result[1].name
    end

    require('lualine').setup {
      sections = {
        lualine_x = { 'fileformat', 'filetype', get_schema },
      },
    }
  end,
}
