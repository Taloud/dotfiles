local nmap = require("taloud.keymap").nmap
local vmap = require("taloud.keymap").vmap

-- Daily Remap
nmap {
  "<leader>ps",
  function()
    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})
  end,
}
nmap { "<C-p>", require("telescope.builtin").git_files }
nmap { "<leader>pb", require("telescope.builtin").buffers }

-- Direct to folder Remap
nmap {
  "<leader>vrc",
  function()
    require("taloud.telescope").search_dotfiles({ hidden = true})
  end,
}

-- Git Remap
nmap { "<leader>gb", require("taloud.telescope").git_branches }
nmap { "<leader>gf", require("telescope.builtin").git_status }
nmap { "<leader>gw", require("telescope").extensions.git_worktree.git_worktrees }
nmap { "<leader>gm", require("telescope").extensions.git_worktree.create_git_worktree }

-- Helper remap
nmap { "<leader>pf", require("telescope.builtin").find_files }
nmap { "<leader>vh", require("telescope.builtin").help_tags }


-- LSP remap
nmap { "gd", require("telescope.builtin").lsp_definitions }
nmap { "gT", require("telescope.builtin").lsp_type_definitions }
nmap { "gi", require("telescope.builtin").lsp_implementations }
nmap {
  "gr",
  function()
    require("telescope.builtin").lsp_references({show_line = false})
  end,
}
nmap { "gl", require("telescope.builtin").diagnostics }
nmap { "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>" }
-- nmap { "ga", require("telescope.builtin").lsp_code_actions }

-- Refactoring remap
vmap { "<leader>rr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>"}
