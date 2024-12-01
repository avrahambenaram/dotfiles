return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = {
      ui = {
        border = "rounded", -- UI border style (can be "single", "double", "rounded", etc.)
        width = 0.8,        -- UI width as a percentage of the terminal width
        height = 0.8,       -- UI height as a percentage of the terminal height
      }
    },
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "cssls", "docker_compose_language_service", "dockerls", "gopls", "jdtls", "jsonls", "html", "lua_ls", "omnisharp", "tailwindcss", "ts_ls" },
      automatic_installation = true,  -- Automatically install servers when you launch LSP
    },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.cssls.setup {}
      lspconfig.docker_compose_language_service.setup {}
      lspconfig.dockerls.setup {}
      lspconfig.gopls.setup {}
      lspconfig.jdtls.setup {}
      lspconfig.jsonls.setup {}
      lspconfig.html.setup {}
      lspconfig.lua_ls.setup {}
      lspconfig.omnisharp.setup {
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true,
          },
          RoslynExtensionsOptions = {
            EnableImportCompletion = true,
          },
        },
      }
      lspconfig.tailwindcss.setup {}
      lspconfig.ts_ls.setup {}

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  },

  {
    'nvimdev/lspsaga.nvim',
    cmd = 'Lspsaga',
    keys = {
      {
        "K",
        "<cmd>Lspsaga hover_doc<CR>"
      },
      {
        "ga",
        "<cmd>Lspsaga code_action<CR>"
      },
      {
        "gR",
        "<cmd>Lspsaga rename<CR>"
      }
    },
    opts = {
      lightbulb = {
        enable = false,
      },
    },
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
  }
}
