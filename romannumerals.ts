//var persons: { [id: string] : IPerson; } = {};
const dict = Object.freeze({
  I: 1,
  V: 5,
  X: 10,
  L: 50,
  C: 100,
  D: 500,
  M: 1000,
  1: "I",
  2: "II",
  3: "III",
  4: "IV",
  5: "V",
  6: "VI",
  7: "VII",
  8: "VIII",
  9: "IX",
  10: "X",
  20: "XX",
  30: "XXX",
  40: "XL",
  50: "L",
  60: "LX",
  70: "LXX",
  80: "LXXX",
  90: "XC",
  100: "C",
  200: "CC",
  300: "CCC",
  400: "CD",
  500: "D",
  600: "DC",
  700: "DCC",
  800: "DCCC",
  900: "CM",
  1000: "M",
});

let sum = (numerals, multiplyer) =>
  [...numerals].reduce((prev, n) => prev + dict[n] * multiplyer, 0);

let add = (numerals) => sum(numerals, 1);
let sub = (numerals) => sum(numerals, -1);
let minusChars = (numerals) =>
  [...numerals].reduce(
    (prev, n, i, arr) =>
      i === arr.length - 1
        ? prev
        : dict[n] < dict[arr[i + 1]]
        ? (prev += n)
        : prev,
    ""
  );
let totalSum = (numerals) => sub(minusChars(numerals)) * 2 + add(numerals);
function recursion(acc: string, rlist: string[], rest: number) {
  if (rest === 0) return acc; //Base case
  acc += rlist[0].repeat(Math.floor(rest / dict[rlist[0]]));
  rest = rest % dict[rlist[0]];
  if (rlist.length === 1) return acc;
  return recursion(acc, rlist.slice(1), rest);
}
// const recursion = (acc: string, rlist: string[], rest: number) =>
//   rest === 0 || rlist.length === 0
//     ? acc
//     : recursion(
//         (acc += rlist[0].repeat(Math.floor(rest / rDict[rlist[0]]))),
//         rlist.slice(1),
//         rest % rDict[rlist[0]]
//       );

//#region romanRec
let romanRec = (x) => recursion("", ["M", "D", "C", "L", "X", "V", "I"], x);
let test2 = romanRec(4);
let test3 = romanRec(9);
let test4 = romanRec(14);
let test5 = romanRec(99);
test2;
test3;
test4;
test5;
//#endregion

let getNext = (x: string) =>
  ["I", "V", "X", "L", "C", "D", "M"].reduce(
    (acc, n, i, arr) => (x === n ? [...acc, arr[i + 1]] : acc),
    []
  )[0];
let romeSub = (m, n) => dict[m] - dict[n];
let romeAdd = (m, n) => dict[m] + dict[n];

test4 = getNext("I");
test4;
function tryParse(s: string, comp: string) {
  let nextVal = dict[comp];
  let sum = add(s);
  let countPrefix = nextVal - sum;
  let prefix = s[0].repeat(countPrefix / dict[s[0]]);
  if (prefix.length > 1) return s;
  else return prefix + comp;
}
test4 = tryParse("IIIIIIIII", "X");
test4;
//LXXXXVIIII 99 XCIX

//IV 5-1
//VI
//IIII
//VIIII
//
