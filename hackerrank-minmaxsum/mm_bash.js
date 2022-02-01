/*
 *Print two space-separated long integers denoting the respective minimum and maximum 
 *values that can be calculated by summing exactly four of the five integers. (The output can be greater than a 32 bit integer.)
 * The function accepts INTEGER_ARRAY arr as parameter.
 */
function miniMaxSum(arr) {
    arr = arr.sort((a,b)=>a-b);
    let min = arr.slice(0,4).reduce((sum, val) => sum+=val);
    let max = arr.slice(1).reduce((sum, val) => sum+=val);
    console.log(min + ' ' + max);
}

let argv = process.argv;
let list = argv.slice(-5);
let numlist = list.map(a => parseInt(a));
miniMaxSum(numlist);
