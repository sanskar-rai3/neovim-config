return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("tokyonight")
        end,
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        -- config = function()
        --     require("catppuccin").setup({
        --         flavour = "mocha",
        --     })
        --
        --     vim.cmd.colorscheme("catppuccin")
        -- end,
    },
}
