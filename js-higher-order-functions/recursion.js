function sum(arr) {
  // 1 => [2,3,4]
  // 2 => [3,4]
  // 3 => [4]
  // 4 => []
  if (arr.length === 0) {
    return 0
  } else {
    // first arr.slice(1) => [2,3,4]
    // second => [3,4]
    // third => [4]
    // fourth => []
    return arr[0] + sum(arr.slice(1))
  }
}

console.log(sum([1,2,3,4]))

// Array destructuring

function sum([first, ...rest]) {
  if (rest.length < 1) {
    return first
  } else {
    return first + sum(rest)
  }
}

// recursive factorial
function factorial(n) {
  if (n === 0) {
    return 1
  } else {
    return n * factorial( n - 1 )
  }
}

console.log(factorial(3));

// reverse a string
function reverse(str) {
  if (str.length === 0) {
    return ""
  } else {
    return str[str.length - 1] + reverse(str.slice(0, -1))
  }
}

console.log(reverse("hello"));