return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        vim.api.nvim_set_hl(0, "AlphaHeader", { link = "Title" })
        vim.api.nvim_set_hl(0, "AlphaButtons", { link = "Normal" })  
        vim.api.nvim_set_hl(0, "AlphaShortcut", { link = "Keyword" })

        dashboard.section.header.val = {
            " ██▒   █▓ ▓█████  ▒█████   ██▒   █▓  ██▓  ███▄ ▄███▓",
            "▓██░   █▒ ▓█   ▀ ▒██▒  ██▒▓██░   █▒ ▓██▒ ▓██▒▀█▀ ██▒",
            " ▓██  █▒░ ▒███   ▒██░  ██▒ ▓██  █▒░ ▒██▒ ▓██    ▓██░",
            "  ▒██ █░░ ▒▓█  ▄ ▒██   ██░  ▒██ █░░ ░██░ ▒██     ▒██ ",
            "   ▒▀█░   ░▒████▒░ ████▓▒░   ▒▀█░   ░██░ ▒██▒    ░██▒",
            "   ░ ▐░   ░ ▒░ ░ ░ ▒░▒░▒░    ░ ▐░   ░▓    ░ ▒░    ░  ░",
            "   ░ ░░   ░ ░  ░   ░ ▒ ▒░    ░ ░░    ▒ ░ ░  ░        ░",
            "     ░░     ░    ░ ░ ░ ▒        ░░    ▒ ░ ░        ░   ",
            "      ░     ░  ░       ░ ░       ░    ░            ░   ",
            "     ░                           ░                     ",
        }
        dashboard.section.header.opts.hl = "AlphaHeader"

        dashboard.section.buttons.val = {
            dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "󰋚  Recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("g", "󰱼  Live grep", ":Telescope live_grep<CR>"),
            dashboard.button("n", "󰜱  New file", ":ene <BAR> startinsert<CR>"),
            dashboard.button("c", "󱁤  Edit config", ":e $MYVIMRC<CR>"),
            dashboard.button("l", "󰒲  Lazy status", ":Lazy<CR>"),
            dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end

        dashboard.config.layout = {
            { type = "padding", val = 5 },
            dashboard.section.header,
            { type = "padding", val = 3 },
            dashboard.section.buttons,
        }

        alpha.setup(dashboard.config)
    end,
}
