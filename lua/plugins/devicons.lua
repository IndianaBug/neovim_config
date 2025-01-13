-- ~/.config/nvim/plugins/devicons.lua
return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup {
      -- optional settings, leave empty for defaults
    }
  end,
}
