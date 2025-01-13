-- plugins/tokyonight.lua
return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night", -- Options: night, storm, day, moon
      transparent = true, -- Enable transparency
      styles = {
        comments = { italic = true },
        keywords = { bold = true },
        functions = { bold = true },
        variables = { bold = false },
      },
      sidebars = { "qf", "vista_kind", "terminal", "packer" },
      on_colors = function(colors)
        colors.bg = "NONE"
      end,
    })
    vim.cmd("colorscheme tokyonight")
  end,
}
