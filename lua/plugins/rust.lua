return {
  "simrat39/rust-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",          -- Utility functions
    "neovim/nvim-lspconfig",          -- Core LSP configuration
    "mfussenegger/nvim-dap",          -- Debugging adapter protocol
    "nvim-telescope/telescope.nvim", -- Fuzzy finder for files, symbols, etc.
    "hrsh7th/nvim-cmp",               -- Autocompletion
    "hrsh7th/cmp-nvim-lsp",           -- LSP source for nvim-cmp
    "L3MON4D3/LuaSnip",               -- Snippet engine
    "saadparwaiz1/cmp_luasnip",       -- Snippet completion source
    "jose-elias-alvarez/null-ls.nvim", -- Formatting and linting
  },
  config = function()
    local rt = require("rust-tools")

    -- Set up `nvim-lspconfig` for rust-analyzer
    rt.setup({
      server = {
        on_attach = function(client, bufnr)
          -- Common LSP keybindings
          local opts = { buffer = bufnr, desc = "LSP" }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Find References" })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })
          vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename Symbol" })
          vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })

          -- Rust-specific keybindings
          vim.keymap.set(
            "n",
            "<Leader>rh",
            rt.hover_actions.hover_actions,
            { buffer = bufnr, desc = "Rust Hover Actions" }
          )
          vim.keymap.set(
            "n",
            "<Leader>ra",
            rt.code_action_group.code_action_group,
            { buffer = bufnr, desc = "Rust Code Action Group" }
          )

          -- Format on save
          if client.server_capabilities.documentFormattingProvider then
            vim.cmd([[
              augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
              augroup END
            ]])
          end
        end,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy", -- Use clippy for on-save linting
            },
            diagnostics = {
              enable = true,
              experimental = {
                enable = true,
              },
            },
          },
        },
      },
      dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(
          "path/to/extension/adapter/codelldb", -- Replace this path
          "path/to/extension/lldb/lib/liblldb.so" -- Replace this path
        ),
      },
    })

    -- Set up `nvim-cmp` for autocompletion
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      },
    })

    -- Set up `null-ls.nvim` for linting and formatting
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.rustfmt.with({
          extra_args = { "--edition", "2021" },
        }),
        null_ls.builtins.diagnostics.clippy,
      },
    })

    -- Telescope integration
    local telescope = require("telescope")
    telescope.setup({})
    vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
    vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
    vim.keymap.set("n", "<Leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
    vim.keymap.set("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
  end,
}
