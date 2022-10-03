const wait = require('./wait')

const randomTime1 = Math.floor((Math.random() * 4) + 1) * 1000
const randomTime2 = Math.floor((Math.random() * 4) + 1) * 1000
const randomTime3 = Math.floor((Math.random() * 4) + 1) * 1000
const randomTime4 = Math.floor((Math.random() * 4) + 1) * 1000
const randomTime5 = Math.floor((Math.random() * 4) + 1) * 1000
// 1000/2000/3000/4000

Promise.race([
  wait(randomTime1, 'Seabiscuit'),
  wait(randomTime2, 'Secretariat'),
  wait(randomTime3, 'Kelso'),
  wait(randomTime4, 'Seattle Slew'),
  wait(randomTime5, 'Winning Brew')
]).then(val => {
  console.log(val);
}).catch(err => {
  console.log(err);
})

