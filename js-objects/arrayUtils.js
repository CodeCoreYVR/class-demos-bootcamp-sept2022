const arrayUtils = {
  // a method is a property of an object whose value is a function
  // Think of it as a function that is owned by an object
  last: function(arr) {
    return arr[arr.length - 1]
  },
  first(arr) {
    return arr[0]
  },
  take: function (arr, n) {
    const result = []
    for (let i = 0; i < n; i++) {
      result.push(arr[i])
    }
    return result
  },

  // Exercise: toObject
  toObject(arr) {
    const newObj = {};

    for (const pair of arr) {
      console.log(pair);
      newObj[pair[0]] = pair[1]
    }

    return newObj
  }
}

const pairs = [
  ["a", 1],
  ["b", 2],
  ["c", 3],
]

console.log(arrayUtils.toObject(pairs));