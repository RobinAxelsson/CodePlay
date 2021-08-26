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
function parse(acc, numb) {
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
function formatRoman(numerals) {
  let deci = totalSum(numerals);
  return parse("", deci);
}
function testSuite() {
  console.log("----------------");
  const expectEqual = function (actual, expected) {
    if (actual === expected) {
      return 1;
    }
    console.log(`false - expected: ${expected} actual: ${actual}`);
    return 0;
  };
  function getTotal(asserts) {
    console.log(
      `Passed: ${asserts.reduce((prev, r) => (prev += r), 0)}/${asserts.length}`
    );
  }
  getTotal([
    expectEqual(totalSum("MMMMMMMMMMMMMIIII"), 13004),
    expectEqual(totalSum("CCXX"), 220),
    expectEqual(totalSum("LLLXXXXX"), 200),
    expectEqual(totalSum("XCIX"), 99),
    expectEqual(totalSum("LXXIX"), 79),
    expectEqual(totalSum("L"), 50),
    expectEqual(totalSum("L"), 50),
    expectEqual(totalSum("VVVVVVVVV"), 45),
    expectEqual(totalSum("IIIII"), 5),
    expectEqual(formatRoman("MMMMMMMMMMMMMIIII"), "MMMMMMMMMMMMMIV"),
    expectEqual(formatRoman("CCXX"), "CCXX"),
    expectEqual(formatRoman("LLLXXXXX"), "CC"),
    expectEqual(formatRoman("VVVVVVVVV"), "XLV"),
    expectEqual(formatRoman("IIIII"), "V"),
    expectEqual(
      parse("", 1000000),
      "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    ),
    expectEqual(parse("", 10000), "MMMMMMMMMM"),
    expectEqual(parse("", 9999), "MMMMMMMMMCMXCIX"),
    expectEqual(parse("", 2000), "MM"),
    expectEqual(parse("", 1000), "M"),
    expectEqual(parse("", 500), "D"),
    expectEqual(parse("", 100), "C"),
    expectEqual(parse("", 99), "XCIX"),
    expectEqual(parse("", 79), "LXXIX"),
    expectEqual(parse("", 50), "L"),
    expectEqual(parse("", 10), "X"),
    expectEqual(parse("", 1), "I"),
    expectEqual(parse("", 4), "IV"),
    expectEqual(parse("", 9), "IX"),
  ]);
}
testSuite();
