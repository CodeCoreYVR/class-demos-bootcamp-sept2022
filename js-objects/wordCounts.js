function wordCounts(sentence) {
  const counts = {};

  for (const word of sentence.split(" ")) {
    if (counts[word]) {
      // When using brackets to create a key-value pair,
      // you are allowed to use an expression inside of
      // the brackets. The value that is returned from
      // the expression will be used as a key.

      // In our case, the expression is the variable
      // 'word' which evaluates to the current word
      // in the iteration.
      counts[word] += 1;
    } else {
      counts[word] = 1;
    }
  }
  return counts;
}

const str = "this is this and that";
console.log(wordCounts(str));

// Solution using basic for loop
const sentence = process.argv[2];
let words = sentence.split(" ");
const counterObject = {};

for (let i = 0; i < words.length; i++) {
  counterObject.hasOwnProperty(words[i])
    ? (counterObject[words[i]] = counterObject[words[i]] += 1)
    : (counterObject[words[i]] = 1);
}

console.log(counterObject);
