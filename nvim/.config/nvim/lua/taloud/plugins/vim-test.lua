return {
  'vim-test/vim-test',
  keys = {
    { '<Leader>tn', ':TestNearest<CR>' },
    { '<Leader>tf', ':TestFile<CR>' },
    { '<Leader>ts', ':TestSuite<CR>' },
    { '<Leader>tl', ':TestLast<CR>' },
    { '<Leader>tv', ':TestVisit<CR>' },
  },
  config = function()
    vim.cmd([[
      let test#php#runner = 'phpunit'
      " let test#php#phpunit#executable = 'docker exec yatta_phpfpm vendor/bin/phpunit'
      let test#php#phpunit#executable = 'XDEBUG_MODE=coverage php -d memory_limit=-1 bin/phpunit'
    ]])

    vim.cmd([[
      let test#javascript#runner = 'playwright'
    ]])
  end
}
