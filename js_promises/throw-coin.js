function throwCoin() {
  return new Promise((resolve, reject) => {
    const side = Math.floor(Math.random() * 2)
    const randomTime = Math.floor((Math.random() * 4) + 1) * 1000

    if (randomTime > 3000) {
      setTimeout(() => {
        reject(new Error("Coin was thrown too high!"))
      }, randomTime);
    } else {
      setTimeout(() => {
        if (side == 1) {
          resolve('tails')
        } else {
          resolve('heads')
        }
      }, randomTime);
    }
  })
}

throwCoin().then((result) => {
  console.log(`You got ${result}`);
}).catch((result) => {
  console.log(result);
})