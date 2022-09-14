function insult(name) {
  const randNum = Math.floor(Math.random() * 3)
  // Math.random returns a random number between 0-1(0 inclusive and 1 exclusive)
  if (randNum === 0) {
    return `${name}, you doofus!`
  } else if (randNum === 1) {
    return `${name}, your father smells!`
  } else {
    return `${name}, your mother is a hamster!`
  }
}

console.log(insult("Bob"));