vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.api.nvim_exec([[
  autocmd FileType html lua vim.bo.shiftwidth = 2
  autocmd FileType html lua vim.bo.tabstop = 2
  autocmd FileType php lua vim.bo.shiftwidth = 2
  autocmd FileType php lua vim.bo.tabstop = 4
  autocmd FileType sql lua vim.bo.shiftwidth = 2
  autocmd FileType sql lua vim.bo.tabstop = 2
  autocmd FileType sql lua vim.bo.shiftwidth = 2
  autocmd FileType javascript lua vim.bo.tabstop = 2
  autocmd FileType javascript lua vim.bo.shiftwidth = 2
]], false)
