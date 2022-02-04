let g:projectionist_heuristics = {
    \ "composer.json": {
    \   "src/*.php": {
    \     "type": "source",
    \     "alternate": "tests/phpunit/{}Test.php",
    \   },
    \   "tests/*Test.php": {
    \     "type": "source",
    \     "alternate": "src/{}.php",
    \   },
    \ }}
