return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-live-grep-args.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  keys = {
    {
      "<C-p>",
      function()
        require("telescope.builtin").find_files()
      end,
    },
    {
      "<leader>pf",
      function()
        require("telescope.builtin").find_files({ no_ignore = true, prompt_title = "All Files" })
      end,
    },
    {
      "<leader>pb",
      function()
        require("telescope.builtin").buffers()
      end,
    },
    { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  },
}
