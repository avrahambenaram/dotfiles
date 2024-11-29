return {
  {
    'SmiteshP/nvim-navic',
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = {
      click = true,
      highlight = true,
      lsp = {
        auto_attach = true,
      },
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'SmiteshP/nvim-navic' },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        icons_enabled = true,
      },
      winbar = {
        lualine_c = {
          "navic",
          {
            color_correction = "dynamic"
          }
        },
      },
    },
  }
}
