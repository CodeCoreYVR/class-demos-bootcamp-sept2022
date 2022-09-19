// JS: Objects
// Creating an object

// And object is defined with braces. Not to be confused
// with a code block.

const dog = {
  // It contains key-value pairs
  // "age" is a key. Keys are always strings.
  // 10 is a value paired with the age key.
  // values can be any type
  age: 10,
  firstName: "Benji",
  lastName: "BurlyBottom",
  toys: [
    "Amazon Delivery Box",
    "Pork leg bone",
    "Rubber Bunny",
    "Pink torn teddy bear"
  ]
};

// To read values associated to a key in an object
// use the dot operator
dog.age; // 10
// The dot operator is shortcut (syntax sugar)
// for using [] brackets to refer to a key.
dog["age"] // 10

// To create new key-value pairs or change the value
// of an existing key-value pair, do the following:
dog.middleName = "Pemberton"
dog["eyeColor"] = "Green"

// Keys with special characters must be read using []
// Using . will throw an error

// dog.fur-color = "Brown" // Illegal key name with .
dog["fur-color"] = "Brown" // Legal with []

// Object utility methods

// Get all keys from an object as an array
// Use the Object.keys() method
Object.keys(dog) // ["age", "firstName", "lastName", "toys" etc...]

// Get all values from an object as an array
Object.values(dog) // [10, "Benji", "BurlyBottom" etc...]

// To merge objects together, use Object.assign()
// In other words, this will combine the key-value
// pairs of all objects passed to Object.assign()
// into a single object
const a = {
  a: 1,
  b: 2,
  c: 3
}
const b = {
  z: 20,
  x: 30,
  y: 40
}

Object.assign(a, b); // {a: 1, b: 2, c: 3, z: 20, x: 30, y: 40}

// This will mutate the first object passed meaning
// that all key-values will be added to the object

a; // {a: 1, b: 2, c: 3, z: 20, x: 30, y: 40}

// To create a new object with the key-value pairs of all 
// passed in objects without mutation any of them, use
// an empty object as the first argument
Object.assign({}, a, b, {
  j: 10,
  k: 20,
  l: 30
})

// When merging objects the same names keys will be overwritten
// where the conflicting key of the last objects being merged
// will have priority

const target = {
  a: 1,
  b: 2
}

const source = {
  b:4,
  c:5
}

const returnedTarget = Object.assign(target, source)

console.log(target); // {a:1, b:4, c:5}

// Iterating over objects

// Use the for..in loop which will iterate over the keys
// of the object. Using the key, we can access it's paired
// value with [] notation
for (const key in dog) {
  console.log("key:", key, "value:", dog[key]);
}