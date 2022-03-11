let g:projectionist_heuristics = {
    \ "composer.json": {
    \   "src/*.php": {
    \     "type": "source",
    \     "alternate": "tests/phpunit/{}Test.php",
    \   },
    \   "tests/phpunit/*Test.php": {
    \     "type": "source",
    \     "alternate": "src/{}.php",
    \   },
    \ }}
