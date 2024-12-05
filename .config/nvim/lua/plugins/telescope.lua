return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  opts = {
    defaults = {
      file_ignore_paterns = { "node_modules", "dist" },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sharkdp/fd",
    "BurntSushi/ripgrep"
  },
  keys = {
    -- File navigation
    {'<leader>pf', '<cmd>Telescope find_files<cr>'},
    {'<C-p>', '<cmd>Telescope git_files<cr>'},
    {'<leader>ps', '<cmd>Telescope live_grep<cr>'},

    -- LSP
    {'gd', '<cmd>Telescope lsp_definitions<cr>'},
    {'gr', '<cmd>Telescope lsp_references<cr>'},

    -- Colorscheme
    {'sp', '<cmd>Telescope colorscheme<cr>'},
  },
}
