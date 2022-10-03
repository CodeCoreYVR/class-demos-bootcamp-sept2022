// A promise to do something in the future
// Has one of 2 outcomes:
// 1) Completed (resolved)
// 2) Failed (rejected)

let p = new Promise((resolve, reject) => {
  // define what the promise is
  let a = 1 + 1;
  if (a == 2) {
    resolve('complete')
  } else {
    reject('fail')
  }
})

p.then((winMessage) => {
  console.log('This is in the then ->' + winMessage);
}).catch((failMessage) => {
  console.log('This is in the then ->' + failMessage);
})