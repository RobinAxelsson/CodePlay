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

//III to iterate and count
let sum = (numerals: string, multiplyer) =>
  [...numerals].reduce((prev, n) => prev + d[n] * multiplyer, 0);
let add = (numerals: string) => sum(numerals, 1);
let sub = (numerals: string) => sum(numerals, -1);

let negatives = (numerals) =>
  [...numerals].reduce(
    (prev, n) => {
      if (prev.numerals === "") {
        prev.numerals += n;
        return prev;
      }
      let end = prev.numerals.slice(-1);
      if (d[end] < d[n]) prev.negatives += end;
      prev.numerals += n;
      return prev;
    },
    { numerals: "", negatives: "" }
  ).negatives;

let totalSum = (numerals) => sub(negatives(numerals)) * 2 + add(numerals);
let test1 = totalSum("XCIX");
test1;
