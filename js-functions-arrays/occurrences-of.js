function occurrencesOf(char, str) {
  let count = 0
  for (let i = 0; i < str.length; i++) {
    if (char === str[i]) {
      count += 1 // same as: count = count + 1 // same count++
    }
  }
  return count
}

console.log(occurrencesOf("l", "hello world"));
console.log(occurrencesOf(" ", "bob likes tea"));
console.log(occurrencesOf("c", "this is this"));