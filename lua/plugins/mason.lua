return {
  'williamboman/mason.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = { 'pyright' }, -- Automatically install pyright
    })

    local lspconfig = require('lspconfig')
    lspconfig.pyright.setup({
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
          },
        },
      },
    })
  end,
}
