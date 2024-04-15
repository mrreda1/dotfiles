return {
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>ll", vim.lsp.buf.format,
                { noremap = true, silent = true, desc = "LSP -> Formatter" }
            )
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()


            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('lspconfig').html.setup({
                filetypes = { "html", "templ", "php" },
                init_options = {
                    configurationSection = { "html", "css", "php" },
                    embeddedLanguages = {
                        css = true,
                        php = true
                    },
                    provideFormatter = true
                }
            })

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                },
            })
        end
    }
}
