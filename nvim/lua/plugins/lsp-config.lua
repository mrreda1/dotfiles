local lsps = {
	"asm_lsp",
	"bashls",
	"clangd",
	"cssls",
	"html",
	"jsonls",
	"jdtls",
	"ltex",
	"texlab",
	"lua_ls",
	"pylsp",
    "pyright",
	"rust_analyzer",
}

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = lsps,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")

            for _, lang in pairs(lsps) do
                lspconfig[lang].setup({
                    capabilities = capabilities
                })
            end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set(
				"n",
				"<leader>ll",
				vim.lsp.buf.format,
				{ noremap = true, silent = true, desc = "LSP -> Formatter" }
			)
		end,
	},
}
