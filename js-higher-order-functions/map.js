const repeat = (str, index) => {
  return str.repeat(index)
}

Map(repeat, ['a', 'b', 'c', 'd', 'e'])

// Recreate map

function map(arr, callback) {
  const newArr = []
  for (const element of arr) {
    newArr.push(callback(element))
  }
  return newArr
}