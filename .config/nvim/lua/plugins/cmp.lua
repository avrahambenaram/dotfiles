return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets'
  },
  config = function ()
    -- Basic cmp setup
    local cmp = require("cmp")

    require("luasnip.loaders.from_vscode").lazy_load()

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)  -- For luasnip
        end,
      },
      mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          local luasnip = require('luasnip')
          if cmp.visible() then
            cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
          -- that way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          local luasnip = require('luasnip')
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-Space>"] = cmp.mapping.complete(),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- LSP completion source
        { name = "luasnip" },    -- Snippet source
        { name = "buffer" },     -- Buffer completion source
        { name = "path" },       -- Path completion source
      }),
      completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      },
    })

    -- For cmdline completions
    cmp.setup.cmdline(':', {
      sources = {
        { name = 'path' },
        { name = 'cmdline' },
      },
    })

    cmp.setup.cmdline('/', {
      sources = {
        { name = 'buffer' },
      },
    })

    vim.keymap.set("i", "<C-n>", "<Plug>luasnip-next-choice")
    vim.keymap.set("s", "<C-n>", "<Plug>luasnip-next-choice")
    vim.keymap.set("i", "<C-p>", "<Plug>luasnip-prev-choice")
    vim.keymap.set("s", "<C-p>", "<Plug>luasnip-prev-choice")
  end
}
