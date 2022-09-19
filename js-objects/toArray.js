const toArray = (obj) => {
  const newArr = []

  for (const key in obj) {
    newArr.push([key, obj[key]])
  }

  return newArr
}

console.log(toArray({a:1, b:2, c:3}));