// Review of Callbacks

// We use callbacks to do something after an asynchronous action
// All async functions accept a callback.
// The callback allows us to do something after the async action

const callback = () => {
  console.log('No... now it ends.');
}

console.log('I wish you have good fortune in the wares to come... and now it begins');

setTimeout(callback, 2000);

const fs = require('fs')

fs.readFile('./files-to-read/file1.txt', 'utf8', (err, data) => {
  if (err) {
    console.log(err);
  } else {
    console.log(data);
  }
})

console.log('print first');

console.log('print second');

// The async function will be triggered as the code is read from top to bottom
// but it won't block code. The console.logs will print out first while the
// async action is happening in the background
// When the async action is done, it will trigger the callback function
// and the text file's text will be printed out


