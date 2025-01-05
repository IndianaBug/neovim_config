require("config.lazy")

vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

-- Function to load all plugins from the "plugins" folder
local function load_plugins_from_folder(folder)
  local plugins = {}
  local path = vim.fn.stdpath("config") .. "/" .. folder

  -- Iterate through each file in the plugins folder
  for _, file in ipairs(vim.fn.readdir(path)) do
    if file:match(".*%.lua$") then  -- Only include Lua files
      -- Use 'dofile' to load each file and add it to the plugins table
      local plugin_config = dofile(path .. "/" .. file)
      table.insert(plugins, plugin_config)
    end
  end

  return plugins
end

-- Load all plugins with Lazy.nvim
require("lazy").setup(load_plugins_from_folder("plugins"))


-- Accept completion
vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true })

-- Cycle through completions
vim.keymap.set("i", "<C-]>", function() return vim.fn end, { expr = true })
vim.keymap.set("i", "<C-[>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })

-- Dismiss completion
vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
