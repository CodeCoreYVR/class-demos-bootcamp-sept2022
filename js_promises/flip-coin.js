function flipCoin() {
  return new Promise((resolve, reject) => {
    const side = Math.floor(Math.random() * 2)
    // 1 will represent tails
    // 0 will represent heads
    if (side == 1) {
      resolve('tails')
    } else {
      reject('heads')
    }
  })
}

flipCoin().then((value) => {
  console.log('Success' + value);
}).catch((value) => {
  console.log('Fail' + value);
})