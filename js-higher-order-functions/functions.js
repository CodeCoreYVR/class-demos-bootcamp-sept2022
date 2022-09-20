// Higher order function that accepts a function as an argument

function sayHi() {
  return "Hi"
}

function fnAccepter(fn) {
  console.log(fn());
}

fnAccepter(sayHi)// logs "hi" to the console

// Higher order function that returns a function

function add(a, b) {
  const total = a + b
}

function fnReturner() {
  return add
}

const adder = fnReturner()
adder === add
adder(4,3) // 7