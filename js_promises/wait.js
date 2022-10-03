function wait(n, val) {
  return new Promise((resolve, reject) => {
    if (val === 'monkeys') {
      reject('no monkeys')
    } else {
      setTimeout(() => {
        resolve(val)
      }, n);
    }
  })
}

module.exports = wait