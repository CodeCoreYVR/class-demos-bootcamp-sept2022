console.log(process.argv);

const firstArg = process.argv[2];
const secondArg = parseInt(process.argv[3]);

console.log("first argument:", firstArg);
console.log("second argument:", secondArg);

console.log(secondArg > 200); 

// -------------Control Flow--------------

// if else statement

if (secondArg > 200) {
  console.log("it's greater than 200");
} else if (secondArg > 100 && secondArg < 200) {
  console.log("it's between 100 and 200");
} else if (secondArg > 0 && secondArg < 100) {
  console.log("it's between 0 and 100");
} else {
  console.log("it's 0 or less");
}

// ternary operator / expression

5 > 7 ? console.log("Yes") : console.log("No");

// while loop
let b = 0
while (b < 10) {
  console.log("winter is coming!");
  b++
}

// for loop
for (let i = 0; i < 10; i++) {
  console.log("winter is coming!");
}
