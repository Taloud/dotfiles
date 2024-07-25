#!/usr/bin/env bash
nvim -c 'tabdo Gvdiffsplit '${1:-develop} $(git diff --name-only --diff-filter=AM ${1:-develop} -- . ":!.git/*") -p
