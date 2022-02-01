#!/bin/bash
JS_CMD="node mm_bash.js"
PY_CMD="python3 mm.py"

testLang() {
    local T1="1 2 3 4 5 10 14" #last two is expected output
    #local T1="0 2 3 4 5 10 14" #error
    local T2="10 11 12 13 14 46 50"
    local T3="7 69 2 221 8974 299 9271"
    local T4="1 1 1 1 1 4 4"
    local T5="1000000000 1000000000 1000000000 1000000000 1000000000 4000000000 4000000000"
    local ARR=("$T1" "$T2" "$T3" "$T4")
    local SCORE=0

    for T in "${ARR[@]}"; do
        {
            testCase $1 $T
            ((SCORE += $?))
        }
    done
    echo $1 $SCORE"/${#ARR[@]}"
}
testCase() {
    local OUT=$("${@:1:7}")
    if [[ $OUT == ${@:8:2} ]]; then
        return 1
    else
        echo FAILED: ${@}
        echo EXPECTED: ${@:8:2} ACTUAL: $OUT
        return 0
    fi
}

testLang "$JS_CMD"
testLang "$PY_CMD"
