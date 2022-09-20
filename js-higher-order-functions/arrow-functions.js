// Basic arrow function syntax
const bark = (name, sound = "Woof!") => {
  return `${name} barks ${sound}`
}
const bark1 = (name, sound = "Woof!") => `${name} barks ${sound}`

const bark2 = name => `${name} barks Woof!`

// converting functions to arrow functions
// 1.
function add(a, b) {
  return a + b
}

const add = (a, b) => a + b

// 2.
function flip(fn) {
  return function (a,b) {
    return fn(b, a)
  }
}

const flip = fn => {
  return (a,b) => {
    return fn(b, a)
  }
}

// 3.
function V(x) {
  return function (y) {
    return function(z) {
      return z(x)(y)
    }
  }
}

//step 1
const V = x => {
  return function (y) {
    return function(z) {
      return z(x)(y)
    }
  }
}

//step 2
const V = x => {
  return y => {
    return function(z) {
      return z(x)(y)
    }
  }
}

// step 3
const V = x => {
  return y => {
    return z => {
      return z(x)(y)
    }
  }
}

// step 4
const V = x => {
  return y => {
    return z => z(x)(y)
  }
}

// step 5
const V = x => {
  return y => z => z(x)(y)
}

// step 6
const V = x => y => z => z(x)(y)


