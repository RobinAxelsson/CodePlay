/*
 *Print two space-separated long integers denoting the respective minimum and maximum 
 *values that can be calculated by summing exactly four of the five integers. (The output can be greater than a 32 bit integer.)
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

function miniMaxSum(arr) {
    arr = arr.sort((a,b)=>a-b)
    let min = arr.slice(0,4).reduce((sum, val) => sum+=val)
    let max = arr.slice(1).reduce((sum, val) => sum+=val)
    return [min, max];
}

function testCase(input, expectedMin, expectedMax){
    let actual = miniMaxSum(input)
    let minActual = actual[0]
    let maxActual = actual[1]
    if (expectedMin == minActual && expectedMax == maxActual) return true
    else{
        console.log(`Expected:${expectedMin},${expectedMax} Actual:${actual}`)
        return false
    }
}

testResults = [
    testCase([1,2,3,4,5], 10, 14),
    testCase([10,11,12,13,14], 46, 50),
    testCase([7,69,2,221,8974], 299, 9271),
    testCase([1000000000, 1000000000, 1000000000, 1000000000, 1000000000], 4000000000, 4000000000),
    testCase([1,1,1,1,1], 4, 4)
]

let passed = testResults.filter(t => t == true).length

console.log(`Passed: ${passed}/${testResults.length}`)