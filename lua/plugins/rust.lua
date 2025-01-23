return {
  "simrat39/rust-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",   -- Required by rust-tools
    "neovim/nvim-lspconfig",   -- Core LSP
    "mfussenegger/nvim-dap",   -- Debugging (optional)
  },
  config = function()
    -- 1. Import rust-tools
    local rt = require("rust-tools")

    -- 2. Setup
    rt.setup({
      -- Configure rust-analyzer via lspconfig
      server = {
        on_attach = function(client, bufnr)
          -- Common Rust LSP keymaps
          local bufmap = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          bufmap("n", "gd", vim.lsp.buf.definition, "Go to Definition")
          bufmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
          bufmap("n", "gr", vim.lsp.buf.references, "Find References")
          bufmap("n", "<Leader>rn", vim.lsp.buf.rename, "Rename Symbol")
          bufmap("n", "<Leader>ca", vim.lsp.buf.code_action, "Code Action")

          -- Optional: Format on save if you like
          if client.server_capabilities.documentFormattingProvider then
            vim.cmd([[
              augroup RustFormat
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
              augroup END
            ]])
          end
        end,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = {
              command = "clippy", -- or "check"
            },
          },
        },
      },

      -- 3. (Optional) Setup for Debugging
      dap = {
        -- If you have codelldb installed separately, set its path here:
        -- adapter = require("rust-tools.dap").get_codelldb_adapter(
        --   "/path/to/extension/adapter/codelldb", -- codelldb executable
        --   "/path/to/extension/lldb/lib/liblldb.so" -- liblldb shared library
        -- ),

        -- Or use system lldb-vscode if installed:
        adapter = {
          type = "executable",
          command = "lldb-vscode",
          name = "rt_lldb",
        },
      },
    })
  end,
}