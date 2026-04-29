-- TODO: fix tree
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'NvimTreeToggle' },
  event = 'VimEnter',

  opts = {
    git = {
      enable = true,
      ignore = false
    },
    disable_netrw = true,
    hijack_cursor = true,

    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      -- aplica os mappings padrão
      api.config.mappings.default_on_attach(bufnr)

      -- REMOVE o 's'
      vim.keymap.del("n", "s", { buffer = bufnr })
    end,
  },

  keys = {
    {
      "<leader>pv",
      "<cmd>NvimTreeToggle<cr>",
    },
  },
}
