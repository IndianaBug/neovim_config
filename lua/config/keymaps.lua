vim.g.codeium_enabled = true

function ToggleCodeiumDisable()
  vim.g.codeium_enabled = false
  vim.cmd("Codeium Disable")
  print("Codeium Disabled ❌")
end

function ToggleCodeiumEnable()
  vim.g.codeium_enabled = true
  vim.cmd("Codeium Enable")
  print("Codeium Enabled ✅")
end

vim.keymap.set("n", "<leader>tce", ToggleCodeiumEnable, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tcd", ToggleCodeiumDisable, { noremap = true, silent = true })

vim.g.chatgpt_enabled = true

function ToggleChatGPTDisable()
  vim.g.chatgpt_enabled = false
  print("ChatGPT Disabled ❌")
end

function ToggleChatGPTEnable()
  vim.g.chatgpt_enabled = true
  print("ChatGPT Enabled ✅")
end

-- Keybindings for ChatGPT
vim.keymap.set("n", "<leader>tgd", ToggleChatGPTDisable, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tge", ToggleChatGPTEnable, { noremap = true, silent = true })
