return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = { "pylsp" },
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        -- put your LSP keymaps here if you want
      end

      -- ✅ Robust: configure pylsp directly (no setup_handlers needed)
      lspconfig.pylsp.setup({
        on_attach = on_attach,
        settings = {
          pylsp = {
            plugins = {
              pyflakes = { enabled = true },
              pylint = { enabled = false }, -- set true if you really want pylint
              mccabe = { enabled = true },  -- you can add threshold if you want
              yapf = { enabled = false },
              autopep8 = { enabled = false },
              black = { enabled = false },
              isort = { enabled = false },
              mypy = { enabled = true },
              ruff = { enabled = true },
            },
          },
        },
      })
    end,
  },
}

