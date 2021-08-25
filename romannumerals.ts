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
let multiplyer = (x) => 10 ** x.toString().length;
let floored = (x) =>
  Math.floor(x / 10 ** x.toString().length) * 10 ** x.toString().length;
function parse(acc: string, numb: number) {
  if (numb === 0) return acc;
  if (numb.toString().length > 3) {
    let r = Math.floor(numb / 1000);
    acc += "M".repeat(r);
    numb -= 1000 * acc.length;
    return parse(acc, numb);
  }
  let base = 10 ** (numb.toString().length - 1);
  let current = Math.floor(numb / base) * base;
  return parse((acc += dict[current]), (numb -= current));
}
let count = (x) => x.toString().length;

function floored2(x: number) {
  let m = 10 ** x.toString().length;
  m = Math.floor(x / m) * m;
  return m;
}
let lambdaParse = (acc: string, x: number) =>
  0 == x
    ? acc
    : x >= 2000
    ? lambdaParse("M".repeat(Math.floor(x / 1000)), x - x / 1000)
    : lambdaParse((acc += dict[floored2(x)]), x - floored2(x));

let input1 = 100000000000;
let a = parse("", input1);
a;
a = a.length;
a;
let input2 = 7;
let b = lambdaParse("", input2);
b;
