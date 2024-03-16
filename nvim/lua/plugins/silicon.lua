return {
	"michaelrommel/nvim-silicon",
	config = function()
		vim.keymap.set("v", "<leader>ss", ":Silicon<CR>")
		vim.keymap.set("n", "<leader>sa", "vgg<ESC>VG:Silicon<CR>")
		local home = os.getenv("HOME")
		require("silicon").setup({
			font = "RobotoMono Nerd Font =22;Noto Color Emoji",
			theme = "Dracula",
			pad_horiz = 80,
			pad_vert = 60,
			line_pad = 5,
			background = nil,
			language = function()
				return vim.bo.filetype
			end,
			to_clipboard = true,
			window_title = function()
				return " JAMmIKA1 - "
					.. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
			end,
			output = function()
				return home
					.. "/Pictures/Code/"
					.. os.date("!%Y-%m-%dT%H-%M-%S")
					.. "."
					.. vim.bo.filetype
					.. ".code.png"
			end,
		})
	end,
}
