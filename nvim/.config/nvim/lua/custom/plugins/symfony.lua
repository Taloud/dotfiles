return {
  "thomas-hiron/symfony-goto.nvim",
  config = function()
    require("symfony-goto").setup()

    vim.keymap.set("n", "<leader>s", ":SymfonyGoto<CR>", { silent = true })
  end,
}
