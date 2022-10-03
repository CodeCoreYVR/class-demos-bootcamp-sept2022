const wait = require('./wait')

// const red = wait(1000, 'red')

// Promise.resolve(red).then((val) => console.log(val))

// const rejectMonkey = wait(1000, 'monkeys')
// rejectMonkey.catch((val) => console.log(val))
// Promise.reject(rejectMonkey).catch((val) => console.log(val))

// Parallel vs Sequential

// console.time('timerA')
// const red = wait(5000, 'red')
// const green = wait(1000, 'green')
// const blue = wait(1000, 'blue')

// red.then(val => {
//   console.log(val);
//   console.timeLog('timerA')
// })
// green.then(val => {
//   console.log(val);
//   console.timeLog('timerA')
// })
// blue.then(val => {
//   console.log(val);
//   console.timeLog('timerA')
// })

// Promise.all
console.time('timerB')
Promise.all([
  wait(5000, 'purple'),
  wait(1000, 'pink'),
  wait(1000, 'orange')
]).then((val) => {
  console.log(val);
  console.timeLog('timerB')
}).catch((err) => {
  console.log(err);
})