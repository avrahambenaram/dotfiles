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
  config = function ()
    local builtin = require('telescope.builtin')

    -- File navigation
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ps', builtin.live_grep)

    -- Lsp
    vim.keymap.set('n', 'gd', builtin.lsp_definitions)
    vim.keymap.set('n', 'gr', builtin.lsp_references)

    -- Colorscheme
    vim.keymap.set('n', 'sp', builtin.colorscheme)
  end
}
