vim.opt.history = 50
vim.opt.wrap = false
vim.opt.mouse = 'a'
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true

vim.opt.background = 'dark'
vim.cmd[[colorscheme nord]]

vim.g.mapleader = ','
vim.g.maplocalleader = ' '

vim.opt.clipboard:append('unnamedplus') -- use system clipboard as default register

vim.opt.relativenumber = true
vim.opt.number = true
