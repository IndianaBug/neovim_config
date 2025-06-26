return {

  -- 1) Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "lua", "rust", "toml", "json" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },

  -- -- 2) LSP Config + Mason
  -- {
  --   config = function()
  --     -- Mason initialization
  --     require("mason").setup()
  --     require("mason-lspconfig").setup()
  --
  --     local lspconfig = require("lspconfig")
  --
  --     -- Setup rust_analyzer (for Rust)
  --     -- lspconfig.rust_analyzer.setup({
  --     --   settings = {
  --     --     ["rust-analyzer"] = {
  --     --       check = {
  --     --         command = "clippy",
  --     --       },
  --     --       diagnostics = {
  --     --         enable = true,
  --     --       },
  --     --       cargo = {
  --     --         allFeatures = true,
  --     --       },
  --     --     },
  --     --   },
  --     -- })
  --   end,
  -- },

  -- 3) Rust Tools: inlay hints, code actions, hover actions, etc.
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Example keymaps for Rust Tools
            vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>ch", rt.hover_actions.hover_actions, { buffer = bufnr })
          end,
          settings = {
            ["rust-analyzer"] = {
              inlayHints = { enable = false },
            },
          },
        },
      })
    end,
  },

  -- 4) crates.nvim: Manage Cargo.toml dependencies
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })
    end,
  },

  ----------------------------------------------------------------------------
  --                            ADDITIONAL PLUGINS                           --
  ----------------------------------------------------------------------------

  -- A) nvim-cmp: Auto-completion (with snippet support)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippet engine
      "L3MON4D3/LuaSnip",

      -- Sources for nvim-cmp
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })

      -- (Optional) load some default vs-code like snippets
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- B) Fidget: LSP progress/status in a small window
  {
    "j-hui/fidget.nvim",
    tag = "legacy", -- For versions before the major rewrite
    config = function()
      require("fidget").setup({})
    end,
  },

  -- C) Trouble: Better Diagnostics/Quickfix list
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({})
      -- Keymap example: open trouble
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
    end,
  },

  -- D) Telescope: Fuzzy finder for files, LSP symbols, etc.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false, -- remove default mapping if you like
              ["<C-d>"] = false,
            },
          },
        },
      })

      -- Example keymaps
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
  },

  -- E) Gitsigns: Inline Git diff markers & hunk actions
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      -- Set up gitsigns without `hl`
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      })

      -- Define highlights separately
      vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "DiffAdd" })
      vim.api.nvim_set_hl(0, "GitSignsChange", { link = "DiffChange" })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "DiffDelete" })
    end,
  },

  -- F) Lualine: Nice statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
