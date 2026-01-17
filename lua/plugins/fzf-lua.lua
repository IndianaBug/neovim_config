return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      -- Use the new fzf binary explicitly
      fzf_bin = vim.fn.expand("~/.local/bin/fzf"),

      -- Avoid E21 'modifiable' issues by opening in a fresh window
      winopts = { split = "belowright new" },
    },
  },
}
