local nmap = require("taloud.keymap").nmap

vim.cmd([[
let test#php#runner = 'phpunit'
" let test#php#phpunit#executable = 'docker exec yatta_phpfpm vendor/bin/phpunit'
]])

nmap { "<leader>tn", ":TestNearest<CR>" }
nmap { "<leader>tf", ":TestFile<CR>" }
nmap { "<leader>ts", ":TestSuite<CR>" }
nmap { "<leader>tl", ":TestLast<CR>" }
nmap { "<leader>tv", ":TestVisit<CR>" }
