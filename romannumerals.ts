//var persons: { [id: string] : IPerson; } = {};
const rDict = Object.freeze({
  I: 1,
  V: 5,
  X: 10,
  L: 50,
  C: 100,
  D: 500,
  M: 1000,
});
let sum = (numerals, multiplyer) =>
  [...numerals].reduce((prev, n) => prev + rDict[n] * multiplyer, 0);

let add = (numerals) => sum(numerals, 1);
let sub = (numerals) => sum(numerals, -1);

let minusChars = (numerals) =>
  [...numerals].reduce((prev, n, i, arr) =>
    i === arr.length - 1
      ? prev
      : rDict[n] < rDict[arr[i + 1]]
      ? (prev += n)
      : prev
  );
let min = minusChars("XLIV");
min;
let totalSum = (numerals) => sub(minusChars(numerals)) * 2 + add(numerals);

let div = (a, b) => Math.floor(a / b);

let test = "X".repeat(3);
test;

let parse = (d, r) => ({
  roman: r.repeat(Math.floor(d / rDict[r])),
  rest: d % rDict[r],
});
//let concat = (d, arr) => ({roman: r.repeat(Math.floor(d/rDict[r])), rest: d % rDict[r]})
function recursion(acc: string, rlist: string[], rest: number) {
  console.log(acc);
  console.log(rlist);
  console.log(rest);
  if (rest === 0) return acc; //Base case
  acc += rlist[0].repeat(Math.floor(rest / rDict[rlist[0]]));
  rest = rest % rDict[rlist[0]];
  if (rlist.length === 1) return acc;
  return recursion(acc, rlist.slice(1), rest);
}
let list = ["M", "D", "C", "L", "X", "V", "I"];
let romanRec = (x) => recursion("", list, x);
let test2 = romanRec(1111);
test2;

//let translate = (x) =>
//["M","D","C","L","X","V","I"].reduce((rn, char) => (), {roman:"", rest:x});
