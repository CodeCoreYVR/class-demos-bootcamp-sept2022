const arr = ["a", "b", "c"]

// regular for loop
// this is when you need the index

for (let i = 0; i < arr.length; i++) {
  console.log('index:', i, "value:", arr[i]);
}

// for..of loop
// this way will loop through the whole array and automatically stop when it reaches the end
for (const value of arr) {
  console.log("value:", value);
}