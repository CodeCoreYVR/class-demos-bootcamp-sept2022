const sum = function (arrOfNumbers) {
  let total = 0

  for (const number of arrOfNumbers) {
    if (typeof number === "number") {
      total += number
    }
  }
  return total
}

let arr = [1,2,3,4,5,6]
let arr2 = [2, 2, "A", 2]
console.log(sum(arr)); // 21
console.log(sum(arr2)); // 6

