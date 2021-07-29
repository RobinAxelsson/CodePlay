JS_CMD="node mm_bash.js"

testLang(){
    local T1="1 2 3 4 5 10 14" #last two is expected output
    local T2="10 11 12 13 14 46 50"
    local ARR=("$T1" "$T2")
    local SCORE=0

    for T in "${ARR[@]}"; do { 
        testCase $1 $T; 
        ((SCORE+=$?));
    } 
    done

    echo $1 $SCORE"/${#ARR[@]}"
}
testCase(){
    local OUT=$("${@:1:7}")
    if [[ $OUT == ${@:8:2} ]]; then
        return 1
    else
        return 0
    fi
}
# testCase(){
#     local OUT=$("${@:1:7}")
#     if [[ $OUT == ${@:8:2} ]]; then
#         echo Passed
#     else
#         echo Fail
#     fi
# }

testLang "$JS_CMD"

#function with input command, output

# function testCase(input, expectedMin, expectedMax){
#     let actual = miniMaxSum(input)
#     let minActual = actual[0]
#     let maxActual = actual[1]
#     if (expectedMin == minActual && expectedMax == maxActual) return true
#     else{
#         console.log(`Expected:${expectedMin},${expectedMax} Actual:${actual}`)
#         return false
#     }
# }

# testResults = [
#     testCase([1,2,3,4,5], 10, 14),
#     testCase([10,11,12,13,14], 46, 50),
#     testCase([7,69,2,221,8974], 299, 9271),
#     testCase([1000000000, 1000000000, 1000000000, 1000000000, 1000000000], 4000000000, 4000000000),
#     testCase([1,1,1,1,1], 4, 4)
# ]

# let passed = testResults.filter(t => t == true).length

# console.log(`Passed: ${passed}/${testResults.length}`)