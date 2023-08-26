-- configuration for json and yaml schemas
local M = {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "folke/neodev.nvim",
  }
}

M.config = function()
  local ok, lspconfig = pcall(require, "lspconfig")
  if not ok then
    return
  end

  local ok, lsp = pcall(require, "lsp-zero")
  if not ok then
    return
  end

  lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

  -- toml schemas
  lspconfig.taplo.setup {
    settings = {
      toml = {
        schemas = {
          ['http://json.schemastore.org/ruff'] = './*.{toml}',
        },
      },
    }
  }

  -- yaml schemas
  lspconfig.yamlls.setup {
    settings = {
      yaml = {
        schemas = {
          ['http://json.schemastore.org/pre-commit-config'] = './.pre-commit-config.{yml,yaml}',
          ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
          ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
          ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}',
        },
      },
    }
  }

  -- lspconfig.pyright.setup {
  --   handlers = {
  --     ['textDocument/publishDiagnostics'] = function(...) end
  --   },
  --   settings = {
  --     typeCheckingMode = 'off', -- no effect here...
  --     python = {
  --       analysis = {
  --         typeCheckingMode = 'off', -- and here...
  --       },
  --     },
  --     pyright = {
  --       disableDiagnostics = true, -- Used to work in coc
  --     }
  --   }
  -- }
end

return M
