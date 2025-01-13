return {
  "nvim-lualine/lualine.nvim",
  requires = { "kyazdani42/nvim-web-devicons", opt = true },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto", -- Use Neovim's current colorscheme
        component_separators = "|",
        section_separators = "",
        globalstatus = true, -- Use a single statusline for all windows
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })

    -- Ensure transparency
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#808080" })
  end,
}
