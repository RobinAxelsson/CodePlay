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
const dDict = Object.freeze({
  1: "I",
  5: "V",
  10: "X",
  50: "L",
  100: "C",
  500: "D",
  1000: "M",
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

let translate = (x) =>
  ["I", "V", "X", "L", "C", "D", "M"].reverse().reduce((numeral, c, i, arr) => {
    let charCount = rDict[c] / x;
    if (charCount < 1) return numeral;
  }, "");
