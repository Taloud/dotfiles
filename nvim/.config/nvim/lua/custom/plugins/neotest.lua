return {
  "nvim-neotest/neotest",
  dependencies = {
    "olimorris/neotest-phpunit",
    "thenbe/neotest-playwright",
    "nvim-neotest/nvim-nio",
  },
  keys = {
    {
      "<leader>tt",
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      desc = "Run File",
    },
    {
      "<leader>tn",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Nearest",
    },
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Last",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle Summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open { enter = true, auto_close = true }
      end,
      desc = "Show Output",
    },
    {
      "<leader>tO",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Toggle Output Panel",
    },
    {
      "<leader>tS",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop",
    },
  },
  config = function()
    require("neotest").setup {
      consumers = {
        playwright = require("neotest-playwright.consumers").consumers,
      },
      adapters = {
        require("neotest-playwright").adapter {
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
            -- filter_dir = function(name, rel_path, root)
            --   return name == "tests/playwright"
            -- end,
          },
        },
        require "neotest-phpunit" {
          phpunit_cmd = function()
            return "bin/phpunit" -- for `dap` strategy then it must return string (table values will cause validation error)
          end,

          -- filter_dirs = { "tests/unit", "tests/dom" }
        },
      },
    }
  end,
}
