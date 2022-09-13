// JavaScript convention is to write  in either camelCase or kebab-case

console.log("Hello World");

// JavaScript statements end with an optional ";"

// This is a comment

/*
  This is
  a multi-line
  comment
*/

// ------------Number------------

1; // Integer

3.14; // Float

Infinity - Infinity;

NaN; // expression was expecting a number but didn't get it

// --------Arithmetic operators--------
1 + 1; // addition

1 - 1; // subtraction

3 * 3; // multiplication

3 / 3; // division

12 % 10; // modulo -> returns the remainder

2 ** 4 - // exponentiation
  3; // Unary negation

// -------------String-----------

("jon"); // single quotes

("snow"); // double quotes "Jon's stuff"

`You know nothing`; // backticks

("This 'is' a valid string");
("This 'is' a valid string");

// string concatenation

"jon" + " " + "snow";

99 +
  "bottles"// String interpolation

  `${3 * 3} for ${"Mortal" + "Men"}`;

// to get the length of a string

"Dark Lord".length; // 9

// index(position)

"Dark Lord"[0]; // D

"Dark Lord"[30]; // undefined

// undefined is a value that does no exist

// -----------Booleans-------------

// a boolean represents a value that is either true or false

// expressions that evaluate to booleans

// string equality operator ===

1 === 1; // true
1 === "1"; // false

1 !== 1; // false
1 !== "1"; // true

// === checks the data type as well
// == won't check the datatype

// greater than
20 > 4; // true

// less than
20 < 20; // false

//less than or equal to
20 <= 20; // true

// greater than or equal to
10 >= 50; // false

// && AND operator
// || OR operator

// ------------Variables-----------------

// use the let keyword with a name to declare a variable

let a;

// to assign a value to a variable, use the assignment operator =

a = 1;

console.log(a); // prints 1

//This is declaring and assigning in one line
let b = 2;

console.log(b);

b = 50; // variables declared using let can be re-assigned

// another way to declare a variable is "const" but ou must assign a value to it at the same time (on the same line)

const hello = "hello";

// multiple declarations and assignments

let s = 1, d = 2;


