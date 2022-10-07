local nmap = require("taloud.keymap").nmap

vim.cmd([[
let test#php#runner = 'phpunit'
" let test#php#phpunit#executable = 'docker exec yatta_phpfpm vendor/bin/phpunit'
]])

-- vim.cmd([[
-- " let test#php#runner = 'phpunit'
-- let test#strategy = "dispatch"
-- let test#php#phpunit#executable = 'COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose run --rm php wait-for-it -t 120 mysql:3306 -- /usr/bin/php-cli.sh bin/phpunit --stop-on-failure'
-- ]])


nmap { "<leader>tn", ":TestNearest<CR>" }
nmap { "<leader>tf", ":TestFile<CR>" }
nmap { "<leader>ts", ":TestSuite<CR>" }
nmap { "<leader>tl", ":TestLast<CR>" }
nmap { "<leader>tv", ":TestVisit<CR>" }
