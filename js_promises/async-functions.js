const wait = require('./wait');

// you can declare an async function by adding the async keyword before the function keyword
// an async function will always return a promise
async function awesome() {
  console.time('timer')
  // inside of an async function you get access to a new operator called await
  // await will wait until a given promise is resolved before moving onto the next line of code
  // await can only be used on a promise

  const red = await wait(1000, 'red')
  console.log(red);
  console.timeLog('timer');
  const blue = await wait(1000, 'blue')
  console.log(blue);
  console.timeLog('timer');

  const colors = await Promise.all([wait(1000, 'red'), wait(2000, 'blue')])
  console.log(colors);
  console.timeLog('timer')

}

awesome()
console.log('a');
console.log('b');