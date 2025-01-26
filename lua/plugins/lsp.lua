return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- Recommended to keep Mason up to date
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pylsp" }, -- Use pylsp instead of pyright
      })

      local lspconfig = require("lspconfig")
      local on_attach = function(client, bufnr)
        -- Keymaps or other LSP-related config can go here
      end
      -- Setup each server you want
      require("mason-lspconfig").setup_handlers({
        ["pylsp"] = function()
          lspconfig.pylsp.setup({
            on_attach = on_attach,
            settings = {
              pylsp = {
                plugins = {
                  pyflakes = { enabled = true }, -- Linter
                  pylint = { enabled = true }, --to true if you prefer pylint
                  mccabe = { enabled = true},--reshold = 10 }, -- Complexity checker
                  yapf = { enabled = true}, --sable yapf formatter
                  autopep8 = { enabled = false }, -- Disable autopep8 formatter
                  black = { enabled = true }, -- Enable Black formatter
                  isort = { enabled = true }, -- Enable isort
                  mypy = { enabled = true }, -- Enable mypy type checking
                  ruff = { enabled = true }, -- Enable Ruff linter
                },
              },
            },
          })
        end,
      })
    end,
  },
}
