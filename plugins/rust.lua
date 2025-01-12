return {
  "simrat39/rust-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local rt = require("rust-tools")

    rt.setup({
      server = {
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set(
            "n",
            "<Leader>rh",
            rt.hover_actions.hover_actions,
            { buffer = bufnr, desc = "Rust Hover Actions" }
          )

          -- Code action groups
          vim.keymap.set(
            "n",
            "<Leader>ra",
            rt.code_action_group.code_action_group,
            { buffer = bufnr, desc = "Rust Code Action Group" }
          )
        end,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
      -- DAP configuration (optional)
      dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
          -- Path to codelldb executable
          "path/to/extension/adapter/codelldb",
          -- Path to liblldb
          "path/to/extension/lldb/lib/liblldb.so"
        ),
      },
    })
  end,
}

