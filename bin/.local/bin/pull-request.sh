#!/usr/bin/env bash
nvim -c 'tabdo Gvdiffsplit '${1:-dev-master} $(git diff --name-only --diff-filter=AM ${1:-dev-master} -- . ":(exclude)public/build/*") -p