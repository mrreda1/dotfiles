vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for

	-- SQL
	-- use 'kristijanhusak/vim-dadbod-ui.nvim'

	-- tabline
	use 'akinsho/bufferline.nvim'
	require('bufferline').setup{
		options = {
		},
	}
	-- coc
	use {
		'neoclide/coc.nvim',
		branch = 'release'
	}

	-- Ale
	use 'dense-analysis/ale'
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-live-grep-args.nvim'},
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end
	}

	-- fugitive
	use 'tpope/vim-fugitive'

	-- floatterm
	use 'preservim/nerdtree'

	-- nvim tree
	use 'nvim-tree/nvim-tree.lua'
	require('nvim-tree').setup()

	-- airline
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'

	-- gitsigns
	use 'lewis6991/gitsigns.nvim'
	require('gitsigns').setup()

	-- trouble
	use {
		'folke/trouble.nvim',
		requires = { {'nvim-tree/nvim-web-devicons'} }
	}

	-- Live server
	use('barrett-ruth/live-server.nvim')
	require('live-server').setup()

	-- Color picker
	use('KabbAmine/vCoolor.vim')

	-- Detect tabstop and shiftwidth automatically
	use('tpope/vim-sleuth')

	-- LaTeX
	use('lervag/vimtex')

	-- blank lines
	use('lukas-reineke/indent-blankline.nvim')

	require('ibl').setup {
		indent = {
			char = '┊',
		},
		whitespace = {
			remove_blankline_trail = false,
		},
	}

	-- Comment with "gc"
	use 'numToStr/Comment.nvim'
	require('Comment').setup()

	-- Discord presence
	use 'andweeb/presence.nvim'
	require("presence").setup({
		main_image = "file",
		neovim_image_text   = "I use arch btw ._.",
		-- blacklist = {'c', 'h'}
	})

	-- Tokyonight theme
	use 'folke/tokyonight.nvim'
	vim.cmd('colorscheme tokyonight-night')

	-- Treesitter
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('norcalli/nvim-colorizer.lua')

	-- Enable colorizer
	require('colorizer').setup()

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
			{'j-hui/fidget.nvim'},            -- Optional
		}
	}

	-- Terminal in neovim
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_filetypes= {},
			shade_terminal = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
	end}

	-- neotree
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		source_selector = {
			statusline = true
		}
	}
	require('neo-tree').setup({
		window = {
			width = 30,
		},
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
			}
		}
	})
	require'lspconfig'.sqlls.setup{
		filetypes = { 'sql' },
		root_dir = function(_)
			return vim.loop.cwd()
		end,
	}


	local lsp = require('lsp-zero').preset({
		name = 'minimal',
		set_lsp_keymaps = true,
		manage_nvim_cmp = true,
		suggest_lsp_servers = false,
	})
	-- (Optional) Configure lua language server for neovim
	lsp.nvim_workspace()

	lsp.setup()

end)
