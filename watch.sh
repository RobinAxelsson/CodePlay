#!/bin/sh
#fswatch -0 ~/Code/CodeChallanges/RomanNumerals/src/ | node ./src/romanNumerals.js
#fswatch -0 ~/Code/CodeChallanges/RomanNumerals/src/
#fswatch ~/Code/CodeChallanges/RomanNumerals/src/
# fswatch -or ~/Code/CodeChallanges/RomanNumerals/src/ | xargs -n1 -I{} echo hello
# fswatch -or ~/Code/CodeChallanges/RomanNumerals/src/romannumerals.js | xargs -n1 -I{} echo hello
# fswatch -or ~/Code/CodeChallanges/RomanNumerals/src/romannumerals.js | xargs -n1 -I{} node ~/Code/CodeChallanges/RomanNumerals/src/romannumerals.js
fswatch -or ./romannumerals.js | xargs -n1 -I{} node ./romannumerals.js
