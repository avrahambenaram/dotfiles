return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "css", "go", "html", "lua", "vim", "vimdoc", "java", "javascript", "typescript" },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
      })
    end
  }
}
