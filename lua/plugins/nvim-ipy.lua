return {
  "bfredl/nvim-ipy",
  lazy = false,
  config = function()
    vim.g.nvim_ipy_perform_mappings = 0 -- Disable default mappings

    -- Define custom key mappings for interacting with Jupyter
    vim.api.nvim_set_keymap("n", "<Leader>r", ":IPythonSendCell<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<Leader>r", ":IPythonSendVisualSelection<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<Leader>R", ":IPythonSendFile<CR>", { noremap = true, silent = true })

    -- Autocommand to set filetype as Python when using IPython
    vim.cmd([[
      autocmd FileType python nnoremap <buffer> <Leader>r :IPythonSendCell<CR>
      autocmd FileType python vnoremap <buffer> <Leader>r :IPythonSendVisualSelection<CR>
    ]])
  end,
}
