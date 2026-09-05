return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "neovim/nvim-lspconfig",
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            local mason_lspconfig = require("mason-lspconfig")

            local servers = {
                "clangd",

                "pyright",

                "html",
                "cssls",
                "ts_ls",
            }

            mason_lspconfig.setup({
                ensure_installed = servers,
            })

            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })

                vim.lsp.enable(server)
            end
        end,
    },

    {
        "hrsh7th/nvim-cmp",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },

        config = function()
            local cmp = require("cmp")

            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },

                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({
                        select = true,
                    }),

                    ["<C-Space>"] = cmp.mapping.complete(),

                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),

                    ["<C-e>"] = cmp.mapping.abort(),
                }),
            })
        end,
    },
}
