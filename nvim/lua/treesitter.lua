require'nvim-treesitter.configs'.setup {

	ensure_installed = { "javascript", "c", "lua", "vim", "python", "rust"},

	sync_install = true,

	auto_install = true,

	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true},
}
