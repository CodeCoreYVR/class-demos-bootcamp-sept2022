function sumRecursive(arr) {
  if (arr.length === 0) {
    return 0
  } else {
    return arr[0] + sumRecursive(arr.slice(1))
  }
}

function sumIteration(arr) {
  let sum = 0
  for (const element of arr) {
    sum += element
  }
  return sum
}

const array = [];
let i = 1
while (array.length < 5000) {
  array.push(i)
  i++
}

console.time("recursive")
sumRecursive(array)
console.timeEnd("recursive")

console.time("iterative")
sumIteration(array)
console.timeEnd("iterative")