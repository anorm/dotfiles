return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup()

            vim.lsp.config("pyright", {
                settings = {
                    pyright = {
                        disableTaggedHints = true,
                    },
                },
            })

            vim.lsp.config("terraformls", {
                init_options = {
                    terraform = {
                        path = vim.fn.exepath("tofu")
                    }
                },
            })

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "pyright",
                    "rust_analyzer",
                    "terraformls",
                },
                automatic_enable = true,
            })
        end,
        keys = {
            {"<leader>d", ":lua vim.diagnostic.open_float(0, {scope='line',source='always'})<cr>"},
            {"gd", vim.lsp.buf.definition,     desc="Go to definition"},
            {"gD", vim.lsp.buf.declaration,    desc="Go to declaration"},
            {"gi", vim.lsp.buf.implementation, desc="Go to implementation"},
        },
        lazy = false,
    }
}
