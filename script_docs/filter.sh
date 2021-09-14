#!/usr/bin/env bash

# awk '{ print #3 }'
### prints 3rd column in input, piped or file

# tail -1 | awk '{ print $3 }'
### Last line 3rd column

# nl -w2 -s ' '
### adds linenumbers

# awk 'NR==<line-number>'
### appends linunber

# awk -F ';' '{ print $5 }'
### sepparates by delimiter ';'

# sed -n '2,5p'
### selects linenumber 2-5
