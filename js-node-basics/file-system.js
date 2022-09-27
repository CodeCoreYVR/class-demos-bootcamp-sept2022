const fs = require('fs')

// fs.readdir('.', (err, data) => {
//   if (err) {
//     console.log(err);
//   }
//   console.log(data);
// })

// When fs is finished reading the files in the directory passed as the first argument it will fire off the callback, and fs will also pass an "err" and "data" object if an error exists then this error will populate with whichever error happened, otherwise data will contain the file names and/or directory names

// fs.writeFile
// 1) PATH to the file to write to (can exist or be new)
// 2) text to write/data
// 3) an optional "options object"
// 4) callback function with 1 arg (err) => {}

// const text = "Hello world again!"

// fs.writeFile("./abc/myFile.txt", text, (err) => {
//   if (err) {
//     console.log("there was an error", err);
//   }
//   console.log("File was created!");
// })

fs.readFile('./abc/myFile.txt', "utf8", (err, data) => {
  if (err) {
    console.log("There was an error", err);
  } 
  console.log("File was read");
  console.log(data);
})

