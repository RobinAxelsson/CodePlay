#!/bin/sh
fswatch -or ./romannumerals.js | xargs -n1 -I{} node ./romannumerals.js
