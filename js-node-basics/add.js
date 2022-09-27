// module.exports = function add(a, b) {
//   return a + b
// }

// function add(a, b) {
//   return a + b
// }
// module.exports = add

function add(a, b) {
  return a + b
}
function sub(a, b) {
  return a - b
}

module.exports = {
  add: add,
  sub: sub
}


