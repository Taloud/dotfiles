-- Git Remap
-- nmap { "<leader>gb", require("taloud.telescope").git_branches }

-- LSP remap
-- vim.keymap.set('n', "<leader>gd", require("telescope.builtin").lsp_definitions)
-- vim.keymap.set('n', "gT", require("telescope.builtin").lsp_type_definitions)
-- vim.keymap.set('n', "gi", require("telescope.builtin").lsp_implementations)
-- vim.keymap.set('n', "<leader>gr", function()
--   require("telescope.builtin").lsp_references({show_line = false})
-- end)
-- vim.keymap.set('n', "gl", require("telescope.builtin").diagnostics)
-- vim.keymap.set('n', "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
--
-- Refactoring remap
-- vmap { "<leader>rr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>"}

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { '<C-p>', function() require('telescope.builtin').find_files() end },
    { '<leader>pf', function() require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' }) end },
    { '<leader>pb', function() require('telescope.builtin').buffers() end },
    { '<leader>ps', function() require('telescope').extensions.live_grep_args.live_grep_args() end },
    -- LSP remaps,
    { 'gd', function() require('telescope.builtin').lsp_definitions() end },
    { 'gT', function() require('telescope.builtin').lsp_type_definitions() end },
    { 'gi', function() require('telescope.builtin').lsp_implementations() end },
    { 'gr', function() require('telescope.builtin').lsp_references({ show_line = false }) end },
    { 'gl', function() require('telescope.builtin').diagnostics({ bufnr=0 }) end },
  },
  config = function ()
    local actions = require('telescope.actions')

    require('telescope').setup({
      defaults = {
        path_display = { truncate = 1 },
        prompt_prefix = '   ',
        selection_caret = '  ',
        layout_config = {
          prompt_position = 'top',
        },
        preview = {
          timeout = 200,
        },
        sorting_strategy = 'ascending',
        mappings = {
          i = {
            ["<C-x>"] = false,
            ["<C-d>"] = actions.delete_buffer,
            ["<C-q>"] = actions.send_to_qflist,
            ["<C-l>"] = actions.send_selected_to_qflist,
            ['<C-Down>'] = actions.cycle_history_next,
            ['<C-Up>'] = actions.cycle_history_prev,
          },
        },
        file_ignore_patterns = { '.git/' },
      },
      extensions = {
        live_grep_args = {
          mappings = {
            i = {
              ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
              ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
            },
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        buffers = {
          previewer = false,
          layout_config = {
            width = 80,
          },
        },
        oldfiles = {
          prompt_title = 'History',
        },
        lsp_references = {
          previewer = false,
        },
        lsp_definitions = {
          previewer = false,
        },
        lsp_document_symbols = {
          symbol_width = 55,
        },
      },
    })

    require('telescope').load_extension('fzf')
  end,
}
