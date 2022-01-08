local nmap = require("taloud.keymap").nmap

nmap { "<leader>ga", ":Git fetch --all<CR>" }
nmap { "<leader>gs", ":G<CR>" }

-- Conflict
nmap { "<leader>gh", ":diffget //3<CR>" }
nmap { "<leader>gu", ":diffget //2<CR>" }

-- Review
nmap { "<leader>rh", ":tabp<CR>" }
nmap { "<leader>rl", ":tabn<CR>" }
nmap { "<leader>rd", ":windo bd<CR>" }
