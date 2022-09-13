const password = process.argv[2]

if (password != undefined) {
  
  if (password.length > 12) {
    console.log("Too long!");
  } else if (password.length < 8) {
    console.log("Too short!");
  } else {
    console.log("Just right!");
  }
}
