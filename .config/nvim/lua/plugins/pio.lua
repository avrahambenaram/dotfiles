return {
  'anurag3301/nvim-platformio.lua',
  -- cmd = { 'Pioinit', 'Piorun', 'Piocmdh', 'Piocmdf', 'Piolib', 'Piomon', 'Piodebug', 'Piodb' },

  -- optional: cond used to enable/disable platformio
  -- based on existance of platformio.ini file and .pio folder in cwd.
  -- You can enable platformio plugin, using :Pioinit command
  config = function ()
      local pok, platformio = pcall(require, 'platformio')
    if pok then
      platformio.setup({
        lsp = 'ccls',
        menu_key = '<leader>pi', -- replace this menu key  to your convenience
      })
    end
  end,

  -- Dependencies are lazy-loaded by default unless specified otherwise.
  dependencies = {
    { 'akinsho/toggleterm.nvim' },
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'folke/which-key.nvim' },
  },
}
