const readline = require('readline')

// need to create a readline interface that gets attached to the readline module
// it accepts one arg of object that has 2 key:value pair properties

const rl = readline.createInterface({
  input: process.stdin, // "process.stdin" is an object that represents input from the terminal
  output: process.stdout // "process.stdout" is an object that represents output from the terminal
})

rl.question("What did you have for breakfast? \n", (answer) => {
  // answer is what the user enters
  console.log(`Eww! I hate ${answer}`);
  rl.close() // without this it will just hang in the environment
})


