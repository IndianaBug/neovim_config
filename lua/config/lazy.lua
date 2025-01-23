-- ~/.config/nvim/lua/config/lazy.lua

-- Setup path for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load Lazy.nvim plugin manager
require("lazy").setup({
  spec = {
    -- Load plugins from LazyVim and your custom configurations
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },

    -- Codeium plugin for AI-powered autocompletion
    {
      "Exafunction/codeium.vim",
      config = function()
        vim.g.codeium_disable_bindings = 1 -- Optional: disable default mappings
      end,
    },

    -- LSP configuration
    {
      "neovim/nvim-lspconfig", -- LSP configuration
      config = function()
        require("lspconfig").rust_analyzer.setup({})
      end,
    },
  },
  defaults = {
    lazy = false, -- Load plugins immediately by default
    version = false, -- Always use the latest git commit
  },
  install = {
    colorscheme = { "tokyonight", "habamax" }, -- Set default colorschemes
  },
  checker = {
    enabled = true, -- Periodically check for plugin updates
    notify = false, -- Disable notifications for updates
  },
  performance = {
    rtp = {
      -- Disable some built-in plugins to improve performance
      disabled_plugins = {
        "gzip", -- Handles compressed files
        "tarPlugin", -- Handles tar archives
        "tohtml", -- Converts buffers to HTML
        "tutor", -- Vim tutor
        "zipPlugin", -- Handles zip archives
        "netrwPlugin", -- Disable netrw if using a file explorer plugin
      },
    },
  },
})