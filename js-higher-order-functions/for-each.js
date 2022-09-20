const arr = [1, 2, 3, 4, 5];

arr.forEach((element) => console.log(element));

arr.forEach((element, index, array) =>
  console.log(`element: ${element}, index: ${index}, array: ${array}`)
);

// Recreating forEach method:

const each = (arr, callback) => {
  for (let i = 0; i < arr.length; i++) {
    return callback(arr[i], i, arr)
  }
}

// OR

function each(arr, callback) {
  for (const element of arr) {
    return callback(element)
  }
}