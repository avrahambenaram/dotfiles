return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "mfussenegger/nvim-dap",
        config = function ()
          vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='DiagnosticError', linehl='', numhl=''})
        end
      }
    },
    keys = {
      {'<leader>db', '<cmd>DapToggleBreakpoint<CR>'},
      {'<F3>', '<cmd>DapContinue<CR>'},
      {'<F4>', '<cmd>DapStepOver<CR>'},
      {'<F10>', '<cmd>lua require"dap".step_back()<CR>'},
      {'<F11>', '<cmd>DapStepInto<CR>'},
      {'<F12>', '<cmd>DapStepOut<CR>'},
      {'<leader>dt', '<cmd>DapTerminate<CR>'},
      {'<leader>dh', '<cmd>lua require"dap.ui.widgets".hover()<CR>'},
    },
    opts = {
      ensure_installed = {
        "delve",
        "netcoredbg",
        "node2"
      },
      handlers = {},
      automatic_installation = true,
    },
    after = "mason.nvim",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    keys = {
      {'<leader>D', '<cmd>lua require("dapui").toggle()<CR>'},
    },
    opts = {
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.5
            },
            {
              id = "stacks",
              size = 0.5
            }
          },
          position = "left",
          size = 55
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5
            },
            {
              id = "breakpoints",
              size = 0.5
            }
          },
          position = "bottom",
          size = 10
        }
      },
    }
  }
}
