const counter = {
  currentCount: 0,
  step: 1,
  set(num) {
    this.currentCount = num
    return this
  },
  inc() {
    this.currentCount += this.step
    return this
  },
  dec() {
    this.currentCount -= this.step
    console.log(this);
    return this
  },
  now() {
    console.log(this.currentCount);
  },
  setStep(num) {
    this.step = num
    return this
  }
}

counter.setStep(2)
counter.inc() // increments by 2
counter.inc() // increments by 2
counter.setStep(10)
counter.dec() // decrements by 10

counter.inc().inc().dec().dec().now()