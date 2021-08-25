//var persons: { [id: string] : IPerson; } = {};
const d = Object.freeze({
  I: 1,
  V: 5,
  X: 10,
  L: 50,
  C: 100,
  D: 500,
  M: 1000,
});

let sum = (numerals, multiplyer) =>
  [...numerals].reduce((prev, n) => prev + d[n] * multiplyer, 0);

let add = (numerals) => sum(numerals, 1);
let sub = (numerals) => sum(numerals, -1);
let endchar = (prev) => prev.numerals.slice(-1);

let minusChars = (numerals) =>
  [...numerals].reduce(
    (prev, n) =>
      prev.numerals === ""
        ? { numerals: (prev.numerals += n), negatives: "" }
        : d[endchar(prev)] < d[n]
        ? {
            negatives: (prev.negatives += endchar(prev)),
            numerals: (prev.numerals += n),
          }
        : {
            numerals: (prev.numerals += n),
            negatives: prev.negatives,
          },
    {
      numerals: "",
      negatives: "",
    }
  ).negatives;

let totalSum = (numerals) => sub(minusChars(numerals)) * 2 + add(numerals);
