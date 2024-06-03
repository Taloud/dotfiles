return {
  'tpope/vim-projectionist',
  dependencies = 'tpope/vim-dispatch',
  config = function()
    vim.g.projectionist_heuristics = {
      ['composer.json'] = {
        ['src/*.php'] = {
          type = 'source',
          alternate = {
            'tests/unit/{}Test.php',
          }
        },
        ['tests/unit/*Test.php'] = {
          type = 'source',
          alternate = {
            'src/{}.php',
          },
        },
      }
    }
  end,
}
