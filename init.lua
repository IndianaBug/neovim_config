vim.opt.shell = "/bin/bash"
vim.opt.shellcmdflag = "-lc"

require("config.leader")
require("config.lazy")
require("config.keymaps")
require("plugins.completion")
require("plugins.transparent")
require("plugins.fzf-lua")
require("plugins.lsp")
require("plugins.treesitter")
require("plugins.nulls")
require("plugins.nvim-ipy")
require("plugins.oxacarbon")
require("plugins.openai")
require("plugins.ntree")
require("plugins.rust")
