return {
    "simrat39/rust-tools.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("rust-tools").setup({})
    end,
}
