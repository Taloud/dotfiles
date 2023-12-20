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
    'nvim-telescope/telescope-file-browser.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  lazy = false,
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

    actions.insert_name_and_path_i = function(prompt_bufnr)
      local symbol = action_state.get_selected_entry().value
      actions.close(prompt_bufnr)
      vim.schedule(function()
        vim.cmd([[startinsert]])
        vim.api.nvim_put({ symbol }, "", true, true)
      end)
    end

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
          filetype_hook = function(filepath, bufnr, opts)
            local excluded = vim.tbl_filter(function(ending)
              return filepath:match(ending)
            end, {
              ".*%.min.js",
              ".*%.min.css",
            })
            if not vim.tbl_isempty(excluded) then
              putils.set_preview_message(
                bufnr,
                opts.winid,
                string.format("I don't like %s files!",
                excluded[1]:sub(5, -1))
              )
              return false
            end
            return true
          end,
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
        file_browser = {
          initial_mode = "normal",
          hijack_netrw = true,
          hidden = { file_browser = true, folder_browser = true },
          mappings = {
            n = {
              ["<C-Y>"] = function(prompt_bufnr)
                local path = require("telescope.actions.state").get_selected_entry().value
                require("telescope.actions").close(prompt_bufnr)
                local clipboardOpt = vim.opt.clipboard:get()
                local useSystemClipb = #clipboardOpt > 0 and clipboardOpt[1]:find("unnamed")
                local reg = useSystemClipb and "+" or '"'
                vim.fn.setreg(reg, path)
                vim.notify("COPIED \n" .. path)
              end,
              ["<C-c>"] = actions.close,
            }
          }
        },
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

    require("telescope").load_extension "file_browser"
    require('telescope').load_extension('fzf')
  end,
}
