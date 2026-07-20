-- Must be set before lazy.nvim loads
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
require("config.lazy")

-- Core settings and keymaps
require("config.options")
require("config.keymaps")
