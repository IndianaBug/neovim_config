return {
    "Exafunction/codeium.vim",
    config = function()
        -- Basic setup
        vim.g.codeium_enabled = true
        vim.g.codeium_disable_bindings = 1  -- Disable default bindings if you want custom ones
    end,
}
