return {
	"p00f/cphelper.nvim",
	vim.keymap.set("n", "<leader>cpr", ":CphReceive<CR>", { desc = "Cph -> Receive" }),
	vim.keymap.set("n", "<leader>cpt", ":CphTest<CR>", { desc = "Cph -> Test" }),
	vim.keymap.set("n", "<leader>cpe", ":CphEdit   ", { desc = "Cph -> Edit/Add" }),
}
