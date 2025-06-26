return {

  -- 1) Tokyonight with Pinkish Code
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Setup Tokyonight
      require("tokyonight").setup({
        style = "storm", -- "night", "storm", "moon", "day"
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = {},
        },
        sidebars = { "qf", "vista_kind", "terminal", "packer" },
      })
      -- Apply Tokyonight
      vim.cmd("colorscheme tokyonight")

      -- Pinkish overrides for code
      vim.cmd([[
        highlight Normal guifg=#ff77aa guibg=#1a1b26
        highlight Comment guifg=#ff88cc
        highlight Identifier guifg=#ff99cc
        highlight Function guifg=#ff66aa
        highlight Statement guifg=#ff55aa
        highlight Type guifg=#ff77dd
      ]])
    end,
  },

  -- 2) Alpha Dashboard with Pink Highlights
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        config = {
          center = {
            {
              icon = "",
              icon_hl = "group",
              desc = "description",
              desc_hl = "group",
              key = "shortcut key in dashboard buffer not keymap !!",
              key_hl = "group",
              key_format = " [%s]", -- `%s` will be substituted with value of `key`
              action = "",
            },
          },
          footer = {},
          vertical_center = false, -- Center the Dashboard on the vertical (from top to bottom)
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  { "nvim-lualine/lualine.nvim", enabled = false },
}
