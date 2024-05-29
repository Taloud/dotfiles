return {
  "nvim-neotest/neotest",
  dependencies = {
    "olimorris/neotest-phpunit",
    "thenbe/neotest-playwright",
  },
  keys = {
    {
      "<leader>ta",
      function()
        require("neotest").playwright.attachment()
      end,
      desc = "Launch test attachment",
    },
  },
  config = function()
    require("neotest").setup({
      consumers = {
        playwright = require("neotest-playwright.consumers").consumers,
      },
      adapters = {
        require("neotest-playwright").adapter({
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
            -- filter_dir = function(name, rel_path, root)
            --   return name == "tests/playwright"
            -- end,
          }

        }),
        require("neotest-phpunit")({
          phpunit_cmd = function()
            return "bin/phpunit" -- for `dap` strategy then it must return string (table values will cause validation error)
          end,

          -- filter_dirs = { "tests/unit", "tests/dom" }
        }),
      }
    })
  end
}
