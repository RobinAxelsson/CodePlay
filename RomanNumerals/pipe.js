const add = (a, b) => a + b;
const multiply = (a, b) => a * b;
const divide = (a, b) => a / b;
const subtract = (a, b) => a - b;

const add5 = (x) => add(x, 5);
const sub10 = (x) => subtract(x, 10);
const divideWith2 = (x) => divide(x, 2);
const multiply6 = (x) => multiply(x, 6);
const pipe = (x, funcs) => funcs.reduce((prev, f) => f(prev), x);

const mathPipe = (x) => pipe(x, [add5, sub10, divideWith2, multiply6]);

out = mathPipe(20);
out;
