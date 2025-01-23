return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/nvim-cmp', -- Completion engine
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  },
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    -- Set up completion capabilities for LSP
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Set up pylsp
    lspconfig.pylsp.setup({
      capabilities = capabilities,
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = { enabled = true },
            pyflakes = { enabled = true },
            pylint = { enabled = false },
            black = { enabled = true },
            mypy = { enabled = true },
          }
        }
      }
    })
  end
}

