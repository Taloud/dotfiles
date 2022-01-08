local nmap = require("taloud.keymap").nmap

-- Daily Remap
nmap {
  "<leader>ps",
  function()
    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})
  end,
}
nmap { "<C-p>", require("telescope.builtin").git_files }
nmap { "<leader>pb", require("telescope.builtin").buffers }

-- Lsp remap
nmap { "<leader>ra", require("telescope.builtin").lsp_code_actions }
nmap { "<leader>rr", require("telescope.builtin").lsp_references }
nmap { "<leader>ri", require("telescope.builtin").lsp_implementations }

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
