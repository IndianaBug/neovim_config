return {
  ---------------------------------------------------------------------------
  -- Treesitter (LazyVim-friendly: extend opts, do NOT call configs.setup here)
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "python", "lua", "rust", "toml", "json" })
      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
      opts.indent = opts.indent or {}
      opts.indent.enable = true
      opts.auto_install = true
    end,
  },

  ---------------------------------------------------------------------------
  -- Rust (modern replacement for rust-tools.nvim)
  ---------------------------------------------------------------------------
  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          -- force using rustup's rust-analyzer
          cmd = { "rustup", "run", "stable", "rust-analyzer" },
          on_attach = function(_, bufnr)
            -- Equivalent-ish mappings to your rust-tools ones
            vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>ch", vim.lsp.buf.hover, { buffer = bufnr })
          end,
          settings = {
            ["rust-analyzer"] = {
              inlayHints = { enable = false },
            },
          },
        },
      }
    end,
  },

  ---------------------------------------------------------------------------
  -- crates.nvim (Cargo.toml helper)
  ---------------------------------------------------------------------------
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup({
        -- removed null_ls integration (LazyVim uses conform/nvim-lint by default)
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Completion
  -- NOTE: LazyVim already includes nvim-cmp by default.
  -- Keeping this can cause duplicate/override behavior. If you see weird cmp
  -- behavior, delete this entire spec and configure via LazyVim opts instead.
  ---------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
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

      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  ---------------------------------------------------------------------------
  -- UI / Utilities
  ---------------------------------------------------------------------------
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup({})
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({})
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      })

      vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "DiffAdd" })
      vim.api.nvim_set_hl(0, "GitSignsChange", { link = "DiffChange" })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "DiffDelete" })
    end,
  },

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

