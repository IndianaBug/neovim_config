return {
  -- Install nvim-treesitter for syntax highlighting and parsing
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "python",
          "rust",
          "toml",
          "json",
          "yaml",
          -- Add more languages as needed
        },
        highlight = { enable = true },
        autotag = { enable = true }, -- Enable nvim-ts-autotag feature
      })
    end,
  },

  -- Install nvim-ts-autotag for auto-closing HTML tags
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
