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

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.fillchars = {
  fold = " ",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
}
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
function _G.custom_foldtext()
  local start_line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart + 1

  return string.format("󰁂 %s  (%d lines)", start_line:gsub("^%s*", ""), line_count)
end

vim.opt.foldtext = "v:lua.custom_foldtext()"

-- Treesitter
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  callback = function(args)
    local buf = args.buf
    local ft = vim.bo[buf].filetype

    if ft == "" then
      return
    end

    local lang = vim.treesitter.language.get_lang(ft) or ft

    pcall(vim.treesitter.start, buf, lang)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  end,
})
