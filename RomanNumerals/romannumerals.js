const romeToDeci = {
  I: 1,
  II: 2,
  III: 3,
  IV: 4,
  V: 5,
  VI: 6,
  VII: 7,
  VIII: 8,
  IX: 9,
  X: 10,
  XX: 20,
  XXX: 30,
  XL: 40,
  L: 50,
  LX: 60,
  LXX: 70,
  LXX: 80,
  XC: 90,
  C: 100,
  CC: 200,
  CCC: 300,
  CD: 400,
  D: 500,
  DC: 600,
  DCC: 700,
  DCCC: 800,
  CM: 900,
  M: 1000,
};
const deciToRome = {
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
};

const isLeftSmaller = (left, right) => romeToDeci[left] < romeToDeci[right];
const splitRoman = (x) =>
  [...x].reduce(
    (prev, val, i, arr) =>
      isLeftSmaller(val, arr[i + 1])
        ? [...prev, val + arr[i + 1]]
        : isLeftSmaller(arr[i - 1], val)
        ? prev
        : [...prev, val],
    []
  );
const deciParseChars = (x) => x.reduce((prev, x) => prev + romeToDeci[x], 0);
const pipe = (x, funcs) => funcs.reduce((prev, f) => f(prev), x);
const deciParse = (x) => pipe(x, [splitRoman, deciParseChars]);

const base10 = (x) => 10 ** (x.toString().length - 1);
const floorIt = (x) => Math.floor(x / base10(x)) * base10(x);
const splitNumber = (x) => [...x.toString()];
const multiply10s = (x) =>
  x.map((val, i, arr) => val * 10 ** (arr.length - i - 1));
const removeZeros = (x) => x.filter((x) => x != 0);
const numeralParse = (x) =>
  x
    .map((val) => (val > 1000 ? "M".repeat(val / 1000) : deciToRome[val]))
    .join(""); //Parses a list with floored numbers: 1000, 300, 40, 20, 1

const romanParse = (x) =>
  pipe(x, [splitNumber, multiply10s, removeZeros, numeralParse]);

const formatRoman = (x) => pipe(x, [deciParse, romanParse]);
const expectEqual = function (actual, expected) {
  if (actual === expected) return 1;
  console.log(`false - expected: ${expected} actual: ${actual}`);
  return 0;
};
function testAsserts(asserts) {
  console.log(
    `Passed: ${asserts.reduce((prev, r) => (prev += r), 0)}/${asserts.length}`
  );
}
function testSuite() {
  console.log("----------------");
  testAsserts([
    expectEqual(isLeftSmaller("I", "X"), true),
    expectEqual(isLeftSmaller("X", "X"), false),
    expectEqual(deciParse("MMMMMMMMMMMMMIIII"), 13004),
    expectEqual(deciParse("CCXX"), 220),
    expectEqual(deciParse("LLLXXXXX"), 200),
    expectEqual(deciParse("XCIX"), 99),
    expectEqual(deciParse("LXXIX"), 79),
    expectEqual(deciParse("L"), 50),
    expectEqual(deciParse("L"), 50),
    expectEqual(deciParse("VVVVVVVVV"), 45),
    expectEqual(deciParse("IIIII"), 5),
    expectEqual(formatRoman("MMMMMMMMMMMMMIIII"), "MMMMMMMMMMMMMIV"),
    expectEqual(formatRoman("CCXX"), "CCXX"),
    expectEqual(formatRoman("LLLXXXXX"), "CC"),
    expectEqual(formatRoman("VVVVVVVVV"), "XLV"),
    expectEqual(formatRoman("IIIII"), "V"),
    expectEqual(
      romanParse(1000000),
      "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    ),
    expectEqual(romanParse(10000), "MMMMMMMMMM"),
    expectEqual(romanParse(9999), "MMMMMMMMMCMXCIX"),
    expectEqual(romanParse(2000), "MM"),
    expectEqual(romanParse(1000), "M"),
    expectEqual(romanParse(500), "D"),
    expectEqual(romanParse(100), "C"),
    expectEqual(romanParse(99), "XCIX"),
    expectEqual(romanParse(79), "LXXIX"),
    expectEqual(romanParse(50), "L"),
    expectEqual(romanParse(10), "X"),
    expectEqual(romanParse(1), "I"),
    expectEqual(romanParse(4), "IV"),
    expectEqual(romanParse(9), "IX"),
  ]);
}
testSuite();
