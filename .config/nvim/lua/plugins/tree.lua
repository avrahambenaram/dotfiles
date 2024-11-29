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
  },
  keys = {
    {
      "<leader>pv",
      "<cmd>NvimTreeToggle<cr>",
    },
  },
}
