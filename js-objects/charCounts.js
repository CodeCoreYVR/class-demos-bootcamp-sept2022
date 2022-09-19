function charCount(str) {
  const counts = {}

  for (const char of str.toLowerCase()) {
    if (counts[char]) {
      counts[char]++
    } else {
      counts[char] = 1
    }
  }
  return counts
}

const myStr = "An archer";
console.log(charCount(myStr));

