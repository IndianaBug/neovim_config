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
require("config.lazy")

vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

local function load_plugins_from_folder(folder)
    local plugins = {}
    local path = vim.fn.stdpath("config") .. "/" .. folder

    for _, file in ipairs(vim.fn.readdir(path)) do
        if file:match(".*%.lua$") then
            local plugin_config = dofile(path .. "/" .. file)
            table.insert(plugins, plugin_config)
        end
    end

    return plugins
end

require("lazy").setup(load_plugins_from_folder("plugins"))


-- Keymaps for virtualenv activation and completions
vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
vim.keymap.set("i", "<C-]>", function() return vim.fn end, { expr = true })
vim.keymap.set("i", "<C-[>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })

-- Autocommand to activate virtualenv on VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        os.execute("source ~/.venvs/uv/bin/activate")
    end
})


local function set_transparency()
    local hl = vim.api.nvim_set_hl
    -- Editor transparency
    hl(0, "Normal", { bg = "NONE" })
    hl(0, "NormalFloat", { bg = "NONE" })
    hl(0, "FloatBorder", { bg = "NONE" })
    hl(0, "SignColumn", { bg = "NONE" }) -- Fix the space between line numbers and text
    hl(0, "FoldColumn", { bg = "NONE" }) -- Fix fold indicators
    hl(0, "VertSplit", { bg = "NONE" })
    hl(0, "EndOfBuffer", { bg = "NONE" })

    -- Disable line highlighting
    hl(0, "CursorLine", { bg = "NONE" }) -- No line highlight
    hl(0, "CursorLineNr", { bg = "NONE", fg = "#FFFFFF", bold = true }) -- Current line number

    -- Make the cursor thin and transparent
    hl(0, "Cursor", { bg = "NONE", fg = "#FFFFFF", blend = 30 })

    -- Optional: Adjust Line Numbers and UI
    hl(0, "LineNr", { bg = "NONE" }) -- Line numbers
    hl(0, "Folded", { bg = "NONE" }) -- Folded text background
    hl(0, "GitSignsAdd", { bg = "NONE" }) -- Git add signs
    hl(0, "GitSignsChange", { bg = "NONE" }) -- Git change signs
    hl(0, "GitSignsDelete", { bg = "NONE" }) -- Git delete signs
end


-- Apply transparency and updates on colorscheme load
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_transparency,
})

-- Apply transparency dynamically for certain events
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "WinLeave", "BufLeave" }, {
    callback = set_transparency,
})

-- Load a default colorscheme or fallback
pcall(vim.cmd, "colorscheme default") -- Change " gruvbox") -- Replace with your themegurations]


-- Additional Customizations
local hl = vim.api.nvim_set_hl

-- Example vibrant highlights with red, green, and blue tones
hl(0, "Function", { fg = "#FF4D4D", bg = "NONE", bold = true }) -- Vibrant Red for functions
hl(0, "Identifier", { fg = "#32CD32", bg = "NONE" }) -- Bright Green for identifiers
hl(0, "Statement", { fg = "#1E90FF", bg = "NONE", italic = true }) -- Dodger Blue for statements
hl(0, "Type", { fg = "#00CED1", bg = "NONE", bold = true }) -- Dark Turquoise for types
hl(0, "Special", { fg = "#FF6347", bg = "NONE" }) -- Tomato Red for special element


-- Force statusline transparency after colorscheme is applied
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#FFFFFF" }) -- Active statusline
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#808080" }) -- Inactive statusline
    end,
})
