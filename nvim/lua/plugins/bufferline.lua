return {
	"akinsho/bufferline.nvim",
	vim.keymap.set("n", "<C-]>", ":bnext<CR>"),
	vim.keymap.set("n", "<C-[>", ":bprevious<CR>"),
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
			},
		})
	end,
}
