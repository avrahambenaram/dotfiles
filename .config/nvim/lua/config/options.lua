vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- Set tab size to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Asks for saving file
vim.opt.confirm = true

vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.colorcolumn = "100"

vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

vim.opt.scrolloff = 10

vim.o.termguicolors = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<C-y>", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<C-y>", '"+y', { desc = "Yank to system clipboard" })
