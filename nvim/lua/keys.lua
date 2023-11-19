vim.g.mapleader = " "

-- lsp go to declaration and definition
vim.keymap.set('n', '<leader>gf', ":lua vim.lsp.buf.definition()<CR>")
vim.keymap.set('n', '<leader>gd', ":lua vim.lsp.buf.declaration()<CR>")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- copy
vim.keymap.set('n', '<C-S-a>', '"+y')
-- Nvim keys
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true


vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.termguicolors = true
