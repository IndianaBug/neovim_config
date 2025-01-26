return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      groups = {
        -- Base groups
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLineNr",
        "EndOfBuffer",
        "Folded",
        "VertSplit",
        "NormalFloat",
        "FloatBorder",
        "FoldColumn",
        "CursorLine",
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",
      },
      extra_groups = {
        -- Additional groups
        "NvimTreeNormal",
        "StatusLine",
        "StatusLineNC",
        "LazyNormal",
        "NormalFloat",
      },
      exclude_groups = {},
    })

    -- Enable transparent mode
    vim.cmd("TransparentEnable")

    -- Custom function to set highlights to `NONE`
    local function set_transparency()
      local hl = vim.api.nvim_set_hl

      -- Core Editor
      hl(0, "Normal",           { bg = "NONE" })
      hl(0, "NormalFloat",      { bg = "NONE" })
      hl(0, "FloatBorder",      { bg = "NONE" })
      hl(0, "SignColumn",       { bg = "NONE" })
      hl(0, "FoldColumn",       { bg = "NONE" })
      hl(0, "VertSplit",        { bg = "NONE" })
      hl(0, "EndOfBuffer",      { bg = "NONE" })

      -- Cursor line & numbers
      hl(0, "CursorLine",       { bg = "NONE" })
      hl(0, "CursorLineNr",     { bg = "NONE", fg = "#FFFFFF", bold = true })
      hl(0, "LineNr",           { bg = "NONE" })
      hl(0, "Folded",           { bg = "NONE" })

      -- Git signs
      hl(0, "GitSignsAdd",      { bg = "NONE" })
      hl(0, "GitSignsChange",   { bg = "NONE" })
      hl(0, "GitSignsDelete",   { bg = "NONE" })

      -- Syntax groups (example custom colors)
      hl(0, "Function",  { fg = "#FF4D4D", bg = "NONE", bold = true })
      hl(0, "Identifier",{ fg = "#32CD32", bg = "NONE" })
      hl(0, "Statement", { fg = "#1E90FF", bg = "NONE", italic = true })
      hl(0, "Type",      { fg = "#00CED1", bg = "NONE", bold = true })
      hl(0, "Special",   { fg = "#FF6347", bg = "NONE" })

      -- Neo-tree or NvimTree
      hl(0, "NeoTreeNormal",      { bg = "NONE" })
      hl(0, "NeoTreeNormalNC",    { bg = "NONE" })
      hl(0, "NeoTreeEndOfBuffer", { bg = "NONE" })
      hl(0, "NeoTreeStatusLine",  { bg = "NONE" })

      -- Lazy.nvim
      hl(0, "LazyNormal",         { bg = "NONE" })
      hl(0, "LazyButton",         { bg = "NONE" })
      hl(0, "LazyButtonActive",   { bg = "NONE" })
      hl(0, "LazyPanel",          { bg = "NONE" })
      hl(0, "LazyPanelBorder",    { bg = "NONE" })
      hl(0, "LazyHeader",         { bg = "NONE" })
      hl(0, "LazyFooter",         { bg = "NONE" })

      -- WhichKey
      hl(0, "WhichKey",           { bg = "NONE" })
      hl(0, "WhichKeyGroup",      { bg = "NONE" })
      hl(0, "WhichKeyDesc",       { bg = "NONE" })
      hl(0, "WhichKeyFloat",      { bg = "NONE" })
      hl(0, "WhichKeyBorder",     { bg = "NONE" })
      hl(0, "WhichKeySeparator",  { bg = "NONE" })
      hl(0, "WhichKeyValue",      { bg = "NONE" })

      -- Noice (if you use Noice for messages)
      hl(0, "NoicePopup",           { bg = "NONE" })
      hl(0, "NoicePopupBorder",     { bg = "NONE" })
      hl(0, "NoiceCmdline",         { bg = "NONE" })
      hl(0, "NoiceCmdlinePopup",    { bg = "NONE" })
      hl(0, "NoiceCmdlinePopupBorder", { bg = "NONE" })
      hl(0, "NoiceConfirm",         { bg = "NONE" })
      hl(0, "NoiceConfirmBorder",   { bg = "NONE" })
      hl(0, "NoiceTitle",           { bg = "NONE" })

      -- Telescope (if you use Telescope to search files, etc.)
      hl(0, "TelescopeNormal",           { bg = "NONE" })
      hl(0, "TelescopeBorder",           { bg = "NONE" })
      hl(0, "TelescopePromptNormal",     { bg = "NONE" })
      hl(0, "TelescopePromptBorder",     { bg = "NONE" })
      hl(0, "TelescopePromptTitle",      { bg = "NONE" })
      hl(0, "TelescopeResultsTitle",     { bg = "NONE" })
      hl(0, "TelescopePreviewTitle",     { bg = "NONE" })
      hl(0, "TelescopePromptCounter",    { bg = "NONE" })
      hl(0, "TelescopeSelection",        { bg = "NONE" })

      -- Popup menu
      hl(0, "Pmenu",          { bg = "NONE" })
      hl(0, "PmenuSel",       { bg = "NONE" })
      hl(0, "PmenuSbar",      { bg = "NONE" })
      hl(0, "PmenuThumb",     { bg = "NONE" })

      -- BufferLine / TabLine
      hl(0, "BufferLineFill",           { bg = "NONE" })
      hl(0, "BufferLineBackground",     { bg = "NONE" })
      hl(0, "BufferLineSelected",       { bg = "NONE" })
      hl(0, "BufferLineSeparator",      { bg = "NONE" })
      hl(0, "BufferLineIndicatorSelected", { bg = "NONE" })
      hl(0, "TabLine",                  { bg = "NONE" })
      hl(0, "TabLineFill",              { bg = "NONE" })
      hl(0, "TabLineSel",               { bg = "NONE" })

      -- Search highlights
      hl(0, "Search",       { bg = "NONE" })
      hl(0, "IncSearch",    { bg = "NONE" })
      hl(0, "CurSearch",    { bg = "NONE" })

      -- Status lines
      hl(0, "StatusLine",   { bg = "NONE" })
      hl(0, "StatusLineNC", { bg = "NONE" })
      hl(0, "WinBar",       { bg = "NONE" })
      hl(0, "WinBarNC",     { bg = "NONE" })

      -- Diagnostics
      hl(0, "DiagnosticError", { bg = "NONE" })
      hl(0, "DiagnosticWarn",  { bg = "NONE" })
      hl(0, "DiagnosticInfo",  { bg = "NONE" })
      hl(0, "DiagnosticHint",  { bg = "NONE" })

      -- Misc
      hl(0, "QuickFixLine", { bg = "NONE" })
      hl(0, "@spell",       { bg = "NONE" })
      hl(0, "@text.markdown", { bg = "NONE" })
      hl(0, "Title",        { bg = "NONE" })

      

    end

    -- Apply transparency on various events
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_transparency,
    })

    vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "WinLeave", "BufLeave" }, {
      callback = set_transparency,
    })

    -- Force statusline transparency after colorscheme is applied
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.api.nvim_set_hl(0, "StatusLine",   { bg = "NONE", fg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#808080" })
      end,
    })

    -- Set the transparency level for floating windows
    vim.opt.winblend = 70 -- Adjust the value (0-100) to set the desired transparency level

    -- Ensure the NormalFloat highlight group has a transparent background
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LazyNormal", { bg = "NONE" })

    -- Load a default colorscheme
    pcall(vim.cmd, "colorscheme gruvbox")  -- Change "gruvbox" to your preferred theme
  end,
}
