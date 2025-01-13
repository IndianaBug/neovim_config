return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      -- Enable transparency for specific elements
      extra_groups = { 
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "FloatBorder",
        "NormalFloat",
        -- Add any additional groups you need
      },
      exclude = {}, -- Groups you want to exclude from being transparent
    })
    require("transparent").enable()
  end,
}
