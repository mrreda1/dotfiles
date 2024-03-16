return {
	"folke/trouble.nvim",
	requires = { { "nvim-tree/nvim-web-devicons" } },
	vim.keymap.set("n", "<leader>e", ":TroubleToggle<CR>"),
}
