local data = assert(vim.fn.stdpath "data") --[[@as string]]

require("telescope").setup {
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
    live_grep = {
      additional_args = function()
        return { "--hidden", "--glob", "!**/.git/*" }
      end,
    },
    grep_string = {
      additional_args = function()
        return { "--hidden", "--glob", "!**/.git/*" }
      end,
    },
  },
  extensions = {
    wrap_results = true,
    fzf = {},
    history = {
      path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
      limit = 100,
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
  },
}

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require "telescope.builtin"

vim.keymap.set("n", "<C-p>", builtin.find_files)
vim.keymap.set("n", "<leader>pf", function()
  builtin.find_files { find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs" } }
end)
vim.keymap.set("n", "<leader>ps", builtin.live_grep)
vim.keymap.set("n", "<leader>pb", builtin.buffers)
vim.keymap.set("n", "<leader>pc", builtin.current_buffer_fuzzy_find)

vim.keymap.set("n", "<leader>pw", builtin.grep_string)
