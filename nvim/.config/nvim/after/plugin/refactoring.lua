local ok, refactoring = pcall(require, "refactoring")
if not ok then
  return
end

local nmap = require("taloud.keymap").nmap
local vmap = require("taloud.keymap").vmap

refactoring.setup({
    -- prompt for return type
    prompt_func_return_type = {
        js = true,
        php = true,
        lua = true,
    },
    -- prompt for function parameters
    prompt_func_param_type = {
        js = true,
        php = true,
        lua = true,
    },
    printf_statements = {
      php = {
        'dump("this is a test from %s");'
      }
    },
    print_var_statements = {
      php = {
        'dump(%s, %s);'
      }
  },
})

-- Print path above
nmap { "<leader>rp", ":lua require('refactoring').debug.printf({below = false})<CR>" }
-- Remap in normal mode and passing { normal = true } will automatically find the variable under the cursor and print it
nmap { "<leader>rv", ":lua require('refactoring').debug.print_var({normal = true})<CR>" }
-- Remap in visual mode will print whatever is in the visual selection
vmap { "<leader>rv", ":lua require('refactoring').debug.print_var({normal = true})<CR>" }
-- Cleanup function: this remap should be made in normal mode
nmap { "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>" }
