-- lua/config/leader.lua
-- Must be loaded BEFORE any plugin/keymap modules.

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Optional: a quick sanity check command
-- :LeaderCheck  -> prints leader visibly
vim.api.nvim_create_user_command("LeaderCheck", function()
  print("mapleader=[" .. (vim.g.mapleader or "") .. "], maplocalleader=[" .. (vim.g.maplocalleader or "") .. "]")
end, {})
