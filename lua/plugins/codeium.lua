return {
    "Exafunction/codeium.vim",
    config = function()
      -- Basic setup
      vim.g.codeium_enabled = true
      vim.g.codeium_disable_bindings = 1 -- Disable default bindings if you want custom ones
  
      -- Custom keybindings
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, noremap = true, silent = true })
  
      vim.keymap.set("i", "<C-]>", function()
        return vim.fn
      end, { expr = true, noremap = true, silent = true })
  
      vim.keymap.set("i", "<C-[>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, noremap = true, silent = true })
  
      vim.keymap.set("i", "<C-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, noremap = true, silent = true })
    end,
  }
  