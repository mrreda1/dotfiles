return {
	"akinsho/bufferline.nvim",
	vim.keymap.set("n", "<Tab>", ":bnext<CR>"),
	vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>"),
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
			},
		})
	end,
}
