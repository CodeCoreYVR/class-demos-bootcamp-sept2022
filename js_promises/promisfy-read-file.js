const { Console } = require('console');
const fs = require('fs');

// should return a promisified version of fs.readFile
// fs.readFile arguments:
// 1) Path
// 2) Options object
// 3) Callback

function pReadFile(path, option) {
  return new Promise((resolve, reject) => {
    fs.readFile(path, option, (err,data) => {
      if (err) {
        reject(err)
      }
      resolve(data)
    })
  })
}

pReadFile('./files-to-read/file1.txt', 'utf8')
.then((data) => {
  console.log(data);
  return pReadFile('./files-to-read/file2.txt', 'utf8')
})
.then((data) => {
  console.log(data);
  return pReadFile('./files-to-read/file3.txt', 'utf8')
})
.then((data) => {
  console.log(data);
  
}).catch((err) => {
  console.log(err);
})