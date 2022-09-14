// function statement

function add(a, b) {
  const total = a + b
  return total
}

console.log(add(1,3));

// function expression

let sum = function (a, b) {
  const total = a + b
  return total
}

console.log(sum(1, 3));