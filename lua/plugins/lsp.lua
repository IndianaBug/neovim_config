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
        ensure_installed = { "pylsp", "ruff" }, -- add ruff
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        -- your keymaps if you want
      end

      -- pylsp: turn OFF ruff here to avoid conflicts
      lspconfig.pylsp.setup({
        on_attach = on_attach,
        settings = {
          pylsp = {
            plugins = {
              pyflakes = { enabled = true },
              mccabe = { enabled = true },
              mypy = { enabled = true },  -- note: requires pylsp-mypy installed
              ruff = { enabled = false }, -- IMPORTANT
            },
          },
        },
      })

      -- ruff LSP: diagnostics + code actions
      lspconfig.ruff.setup({
        on_attach = function(client, bufnr)
          -- optional: stop ruff from providing hover if you prefer pylsp's hover
          client.server_capabilities.hoverProvider = false
          on_attach(client, bufnr)
        end,
      })
    end,
  },
}
